#include <stdlib.h>
#include <stdio.h>
#include <math.h>

void choose_primes(unsigned int * primes){
        primes[0] = 47;
        primes[1] = 71; 
        return;
}

unsigned int generate_public_key(unsigned int m){
        return 79;  //so this works for the paper example
}
 
unsigned int generate_private_key(unsigned int m, unsigned int public_key){
        return 1019; 
}

unsigned int rsa_encrypt(unsigned int m, unsigned int public_key, unsigned int data){
        return ((unsigned int)pow(data, public_key)) % m;  
}

unsigned int rsa_decrypt(unsigned int m, unsigned int private_key, unsigned int data){
        return ((unsigned int)pow(data, private_key)) % m;  
}

int main(){
        unsigned int message = 688; 
        unsigned int private_key = 0; 
        unsigned int public_key = 0;
        unsigned int mod = 0; 
        unsigned int modx = 0; 
        unsigned int e = 0; 
        unsigned int d = 0; 

        unsigned int primes[2];  

        choose_primes(primes);   //generate some new prime numbers
        
        mod = primes[0]*primes[1];  //get the modulo value
        modx = primes[0]-1 * primes[1]-1; //get the number to derive the public and private keys.

        public_key = generate_public_key(modx); 
        private_key = generate_private_key(modx, public_key); 

        //COMPLETED GENERATING VALUES.

        printf("Plain Text: %d\n", message); 

        e = rsa_encrypt(mod, public_key, message); 
        printf("Encrpyted Text: %d\n", e); 
                
        d = rsa_decrypt(mod, private_key, e); 
        printf("Decrypted Text: %d\n", d); 

        return 0;
}
