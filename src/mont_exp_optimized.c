#include <stdio.h>
#include <math.h>

int count_num_bits(int value) {
    int count = 0;

    while(value > 0) {
        count ++;
        value >>= 1;
    }
    return count;
}

int montgomery_multiplication(int x, int y, int m) {
    int t = 0;
    int i = count_num_bits(m);
    int n;
    int check_bit = 1;
    int y_mod = y & 1;
    int x_check;

    for(; i != 0; i--, check_bit <<= 1) {
        x_check = ((x & check_bit) != 0);
        n = (t & 1) + x_check * y_mod;
        t = (t + x_check * y + (n * m)) >> 1;
    }
    if(t >= m) {
        t -= m;
    }
    return t;
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
    num_bits = 1 << num_bits;

    for(i = 1; i < num_bits; i <<= 1) {
        if(e & i) {
            z = montgomery_multiplication(z, p, m);
        }        
        p = montgomery_multiplication(p, p, m);
    }
    z = montgomery_multiplication(1, z, m);
    printf("%d\n", z);
}