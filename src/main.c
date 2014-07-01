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

        table[length++] = base % divsor; 

        for(i = 1; i < 1<<powers[powers_length-1]; i<<=1){
                table[length] = ipow(table[length-1], 2)%divsor; 
                length ++; 
        }
        return length; 
}

int compute_modulus_from_look_up_table(int * table, int powers_size, int * powers, int divsor){
        int i = 0; 
        int temp = 1; 
        
        temp = table[0]; 
        
        for(i=1; i<powers_size; i++){
                temp *= table[powers[i]]; 
                temp %= divsor; 
        }
        return temp; 
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

        int exp_value = 2753; 
        int base_value = 855; 
        int divsor_value = 3233; 

        int count = compute_powers_of_two(exp_value, 32, r);

        int table_size = compute_lookup_table(base_value, divsor_value, r, count, table); 

        int mod_exp = modular_exp(base_value, exp_value, divsor_value); 

        int x = compute_modulus_from_look_up_table(table, count, r, divsor_value); 

        printf("Modular Exp Result: %d\n", mod_exp); 
        printf("Table Result : %d\n", x); 

        return 0; 
}
