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

long long int montgomery_multiplication(long long unsigned int x, long long unsigned int y, long long unsigned int m) {
    int t = 0;

    //find the number of bits in the modulus operator
    int count = 0; 
    long long unsigned int temp = m; 
    while(temp > 0){
        count ++; 
        temp >>= 1; 
    }

    int i = count; 
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

    long long unsigned int x = 123;
    long long unsigned int m = 3233;
    long long unsigned int e = 17;

    int num_bits = count_num_bits(m);
    long long unsigned int nr = (1 << (2 * num_bits)) % m;
    long long unsigned int z = montgomery_multiplication(1, nr, m);
    long long unsigned int p = montgomery_multiplication(x, nr, m);
    int i = 0;
    num_bits = 1 << num_bits;

    for(i = 1; i < num_bits; i <<= 1) {
        if(e & i) {
            z = montgomery_multiplication(z, p, m);
        }        
        p = montgomery_multiplication(p, p, m);
    }
    z = montgomery_multiplication(1, z, m);

    printf("%d\n", sizeof(long long unsigned int));

    printf("%lld\n", z);
}
