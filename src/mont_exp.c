#include <stdio.h>
#include <math.h>

int montgomery_multiplication(int x, int y, int m) {
    int t = 0;
    int i = 0;
    int n;
    int iteration_limit = count_num_bits(m);
    int check_bit = 1;

    for(i = 0; i < iteration_limit; i++, check_bit <<= 1) {         
        n = (t & 1) + ((x & check_bit) == check_bit) * (y & 1);              
        t = ((t + ((x & check_bit) == check_bit) * y + (n * m))) >> 1;
    }
    if(t >= m) {
        t = t - m;
    }
    return t;
}

int count_num_bits(int value) {
    int count = 0;

    while(value > 0) {
        count ++;
        value >>= 1;
    }
    return count;
}

int main(int argc, char * argv[]) {

    int x = 123;
    int m = 3233;
    int e = 17;

    int num_bits = count_num_bits(m);
    int nr = (1 << (2 * num_bits)) % m;
    int z = montgomery_multiplication(1, nr, m);
    int p = montgomery_multiplication(x, nr, m);
    int i = 0;

    for(i = 0; i < num_bits; i++) {
        if(e & (1 << i)) {
            z = montgomery_multiplication(z, p, m);
        }        
        p = montgomery_multiplication(p, p, m);
    }
    z = montgomery_multiplication(1, z, m);
    printf("%d\n", z);
}