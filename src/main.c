#include <stdio.h>
#include <math.h>

//COMPILE WITH:  gcc -Wall main.c -lm

#define MAX_TABLE_SIZE 64

int compute_powers_of_two( int exp, int num_powers, int * result) {
    int i = 0; 
    int j = 0; 
    int temp = 0; 

    for(i = 0; i < num_powers; i ++) {
        temp = 1 << i; 
        if((temp & exp) != 0){
                result[j++] = i;
        }
    }
    return j; 
} 

int ipow(int base, int exp) {
    int result = 1; 
    while(exp){
        if(exp & 1){
            result *= base; 
        }
        exp >>= 1; 
        base *= base; 
    }
    return result; 
}

int compute_lookup_table(int base, int divisor, int * powers, int powers_length,   int * table) {
    int i = 0; 
    int length = 0; 

    table[length++] = base % divisor; 

    for(i = 1; i < 1<<powers[powers_length-1]; i<<=1) {
        table[length] = ipow(table[length-1], 2)%divisor; 
        length ++; 
    }
    return length; 
}

int compute_modulus_from_look_up_table(int * table, int powers_size, int * powers, int divisor) {
    int i = 0; 
    int temp = 1; 
    
    temp = table[0]; 
    
    for(i=1; i<powers_size; i++) {
        temp *= table[powers[i]]; 
        temp %= divisor; 
    }
    return temp; 
}

int modular_exp(int base, int exp, int divisor) {
    int result = 1; 

    base = base % divisor;  

    while(exp > 0) {
        if(exp % 2 == 1){
            result = (result * base) % divisor; 
        }
        exp >>= 1; 
        base = (base * base) % divisor; 
    }
    return result; 
}

int count_num_bits(int value) {
    int count = 0;

    while(value > 0){
        count ++;
        value >>= 1;
    }
    return count;
}

int montgomery_multiplication(int x, int y, int m) {
    int t = 0;
    int i = 0;
    int n;
    int iteration_limit = count_num_bits(m);
    int check_bit = 1;

    for(i = 0; i < iteration_limit; i++, check_bit <<= 1) {         
        n = (t & 1) + ((x & check_bit) == check_bit) * (y & 1);              
        t = ((t + ((x & check_bit) == check_bit) * y + (n * m))) / 2;
    }
    if(t >= m) {
        t = t - m;
    }
    return t;
}

// Algorithm adapted from pseudocode provided in the following research paper:
// http://citeseerx.ist.psu.edu/viewdoc/download;jsessionid=8A3F80C41B8678E7241A0A6286ECAE56?doi=10.1.1.121.1005&rep=rep1&type=pdf
int montgomery_exp(int x, int e, int m) {
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
    return z;
}

/*
* This assumes that we need to compute the lookup
* tables for each new call to encrpy. 
*/
int rsa_encrpyt_lookup_table(int data, int m, int public_key) {
    int powers[MAX_TABLE_SIZE]; 
    int lookup_table[MAX_TABLE_SIZE]; 
    int num_powers = compute_powers_of_two(public_key, 32, powers);
    int table_size = compute_lookup_table(data, m, powers, num_powers, lookup_table); 
    int x = compute_modulus_from_look_up_table(lookup_table, num_powers, powers, m); 
    return x;  
}

int rsa_decrypt_lookup_table(int data, int m, int private_key) {
    int powers[MAX_TABLE_SIZE]; 
    int lookup_table[MAX_TABLE_SIZE]; 
    int num_powers = compute_powers_of_two(private_key, 32, powers);
    int table_size = compute_lookup_table(data, m, powers, num_powers, lookup_table); 
    int x = compute_modulus_from_look_up_table(lookup_table, num_powers, powers, m); 
    return x;  
}

int rsa_encrypt_modular_exp(int data, int m, int public_key) {
    return modular_exp(data, public_key, m);  
}

int rsa_decrypt_modular_exp(int data, int m, int private_key) {
    return modular_exp(data, private_key, m);  
}

int rsa_encrypt_montgomery_exp(int data, int m, int public_key) {
    return montgomery_exp(data, public_key, m);  
}

int rsa_decrypt_montgomery_exp(int data, int m, int private_key) {
    return montgomery_exp(data, private_key, m);  
}

int main(int argc, char * argv[]) {
    
    int r[MAX_TABLE_SIZE]; 
    int table[MAX_TABLE_SIZE]; 

    int exp_value = 2753; 
    int base_value = 855; 
    int divisor_value = 3233; 

    int count = compute_powers_of_two(exp_value, 32, r);
    int table_size = compute_lookup_table(base_value, divisor_value, r, count, table); 
    int x = compute_modulus_from_look_up_table(table, count, r, divisor_value);
    int mod_exp = modular_exp(base_value, exp_value, divisor_value); 
    int mont_exp = montgomery_exp(base_value, exp_value, divisor_value);     

    printf("===============UNIT TESTS==============\n"); 
    printf("Table Result : %d\n", x); 
    printf("Modular Exp Result: %d\n", mod_exp); 
    printf("Montgomery Exp Result : %d\n", mont_exp);     

    printf("===============RSA TESTS===============\n"); 
    printf("Inputs: \n"); 
    
    int public_key = 17; 
    int private_key = 2753; 
    int divisor = 3233; 
    int plain_text = 123; 
    int cipher_text = 0; 
    int new_text = 0; 

    printf("public_key : %d\n", public_key); 
    printf("private_key : %d\n", private_key); 
    printf("divisor : %d\n", divisor); 
    printf("plain_text : %d\n", plain_text); 

    //Test the lookup table method of encryption. This will recompute the 
    //lookup table for each call to the encrpyt/decrypt functions. 
    printf("\n---LOOKUP TABLE METHOD-----\n"); 
    cipher_text = rsa_encrpyt_lookup_table(plain_text, divisor, public_key); 
    new_text = rsa_decrypt_lookup_table(cipher_text, divisor, private_key); 
    printf("cipher_text : %d, plain_text : %d\n", cipher_text, new_text); 

    //Tests the modular exponetation method of encryption.
    printf("\n---MODULAR EXPONENATION METHOD-----\n"); 
    cipher_text = rsa_encrypt_modular_exp(plain_text, divisor, public_key); 
    new_text = rsa_decrypt_modular_exp(cipher_text, divisor, private_key); 
    printf("cipher_text : %d, plain_text : %d\n", cipher_text, new_text);

    //Tests the modular exponetation method of encryption using Montgomery Multiplication.
    printf("\n---MONTGOMERY EXPONENATION METHOD-----\n"); 
    cipher_text = rsa_encrypt_montgomery_exp(plain_text, divisor, public_key); 
    new_text = rsa_decrypt_montgomery_exp(cipher_text, divisor, private_key); 
    printf("cipher_text : %d, plain_text : %d\n", cipher_text, new_text);      

    printf("=======================================\n\n");

    return 0; 
}
