#include <stdio.h>
#include <math.h>

//COMPILE WITH:  gcc -Wall main.c -lm

#define MAX_TABLE_SIZE 64

int compute_powers_of_two( int exp, int num_powers, int * result){
        int i = 0; 
        int j = 0; 
        int temp = 0; 

        for(i = 0; i < num_powers; i ++){
                temp = 1 << i; 
                if((temp & exp) != 0){
                        result[j++] = i;
                }
        }
        return j; 
} 

int ipow(int base, int exp){
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

int compute_lookup_table(int base, int divsor, int * powers, int powers_length,   int * table){
        int i = 0; 
        int length = 0; 
        printf("powers[length=1]: %d\n", powers[powers_length-1]); 

        table[length++] = base % divsor; 

        for(i = 1; i < 1<<powers[powers_length-1]; i<<=1){
                table[length] = ipow(table[length-1], 2)%divsor; 
                printf("%d\n",table[length]); 
                length ++; 
        }
        return length; 
}

int modular_exp(int base, int exp, int divsor){
        int result = 1; 

        base = base % divsor;  

        while(exp > 0){
                if(exp % 2 == 1){
                        result = (result * base) % divsor; 
                }
                exp >>= 1; 
                base = (base * base) %divsor; 
        }
        return result; 
}

int main(int argc, char * argv[]){
        
        int r[MAX_TABLE_SIZE]; 
        int table[MAX_TABLE_SIZE]; 

         int value = 2753; 

        int count = compute_powers_of_two(value, 32, r);

        int table_size = compute_lookup_table(855, 3233, r, count, table); 

        int mod_exp = modular_exp(855, value, 3233); 

        printf("Modular Exp Result: %d\n", mod_exp); 
        int i = 0; 

        printf("---------------\n");
        for(i = 0; i< table_size;i++){
                printf("%d\n", table[i]); 
        }       
        printf("---------------\n");
        for(i = 0; i< count;i++){
                printf("%d\n", r[i]); 
        }
        return 0; 
}
