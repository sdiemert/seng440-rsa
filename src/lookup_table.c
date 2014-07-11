#include <stdio.h>
#include <math.h>
#define MAX_TABLE_SIZE 64
int compute_powers_of_two( int exp, int num_powers, int * result) {
    int i = 0; 
    int j = 0; 
    int temp = 0; 

    for(i = 0; i < num_powers; i ++) {
        temp = 1 << i; 
        if((temp & exp) != 0) {
                result[j++] = i;
        }
    }
    return j; 
} 

int ipow(int base, int exp) {
    int result = 1; 
    while(exp) {
        if(exp & 1) {
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
        table[length] = ipow(table[length-1], 2) % divisor; 
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

int main(int argc, char * argv[]) {
    
    int r[MAX_TABLE_SIZE]; 
    int table[MAX_TABLE_SIZE]; 

    int exp_value = 2753; 
    int base_value = 855; 
    int divisor_value = 3233; 

    int count = compute_powers_of_two(exp_value, 32, r);
    int table_size = compute_lookup_table(base_value, divisor_value, r, count, table); 
 
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



}
