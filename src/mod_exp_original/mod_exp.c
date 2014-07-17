#include <stdio.h>
#include <math.h>

int main(int argc, char * argv[]) {
    int result = 1; 
    int base = 123;
    int divisor = 3233;
    int exp = 17;  

    base = base % divisor;  

    while(exp > 0) {
        if(exp 2 == 1) {
            result = (result * base) % divisor; 
        }
        exp >>= 1; 
        base = (base * base) % divisor; 
    }
    printf("%d\n", result);
}
