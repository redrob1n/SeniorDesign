#define TILE_WIDTH 256

#define TILE_WIDTH      256
#define POP_MAX         50
#define CHROM_MAX       65
#define CHROM_SIZE      64
#define SEED            347834
#define CROSS_PROB      0.85
#define MUT_PROB        0.05      
#define MIN_MUT_FUN     1000000
#define NUM_GEN         100


void get_parent(__global char * restrict cur_pop ,char * restrict chrom, int chrom_size, int pop_size);

void copy_chrom_best_mem(__global char * restrict chrom1, char *restrict chrom2, int chrom_size);
void copy_chrom(char * restrict chrom1, char * restrict  chrom2, int chrom_size);
void copy_chrom_cur_pop(char * restrict chrom1,__global char * restrict chrom2, int chrom_size);


int fit_fun(char * restrict chrom, int chrom_size);
void cross_over(char * restrict chrom, char * restrict chrom1, char * restrict chrom2, int chrom_size, double *random_set, int *random_set_index, int *num_random_remaining);
void mutate(char * restrict  chrom, int chrom_size);

int rnd_chrom(int chrom_size, double *random_set, int *random_set_index, int *num_random_remaining);
int rnd_member(int pop_size, double *random_set, int *random_set_index, int *num_random_remaining);


__constant const int dst_mat[65][65]= {
#include "coords.h"
};
        
__kernel void genetic_algorithm(int pop_size, int chrom_size, int num_gen, int prob_cross, int prob_mut, int min_fit_fun,
         __global char * restrict pop1, __global char * restrict pop2, __global char * restrict best_member), __global double *random_set)
{
        char parent1[CHROM_MAX];
        char parent2[CHROM_MAX];
        
        int cur_obj;
        char *temp_ptr;

        double random_set_local[500];
        int j = get_global_id(0);
        int random_set_index = 0;
        int num_random_remaining = pop_size;

        for(int i = 0; i < 200; i++)
                random_set_local[i] = random_set[(j) * 200 + i];
        j *= 2;
        j += 1;
        
        for (size_t j=0;j<pop_size;j++){
            get_parent(pop1, parent1, chrom_size, pop_size);            /* Selection */

            if (prob_cross < random_set_local[get_rnd(1, num_random_remaining, random_set[random_set_index])]) 
            {
                random_set_index += 1;
                num_random_remaining--;
                get_parent(pop1, parent2, chrom_size, pop_size);                    /* Selection */
                cross_over(parent1,parent1,parent2, chrom_size, random_set_local, random_set_index, num_random_remaining);    /* Cross over */
            }
            else
            {
                random_set_index += 1;
                num_random_remaining--;
            }

            /* Mutation */
            if (prob_mut < random_set_local[get_rnd(1, num_random_remaining, random_set[random_set_index])]) 
            {
                random_set_index += 1;
                num_random_remaining--;
                mutate(parent1, random_set_local, random_set_index, num_random_remaining);
            }
            else
            {
                random_set_index += 1;
                num_random_remaining--;
            }


            for (size_t k=0;k<chrom_size;k++)    *(&pop2[0]+j*CHROM_MAX+k) = parent1[k];

            cur_obj = fit_fun(parent1, chrom_size); /* Fitness */

            if (cur_obj<min_fit_fun) {
                min_fit_fun=cur_obj;
                copy_chrom_best_mem(best_member,parent1, chrom_size);
            }

        }
}

void get_parent(__global char * restrict cur_pop ,char * restrict  chrom, int chrom_size, int pop_size)
{
        char can1[CHROM_MAX];
        char can2[CHROM_MAX];
        
        copy_chrom_cur_pop(can1,(cur_pop + rnd_member(pop_size)*CHROM_MAX), chrom_size);

        copy_chrom_cur_pop(can2,(cur_pop + rnd_member(pop_size)*CHROM_MAX), chrom_size);

        if (fit_fun(can1, chrom_size)<fit_fun(can2, chrom_size))
                copy_chrom(chrom,can1, chrom_size);
        else
                copy_chrom(chrom,can2, chrom_size);
}
void copy_chrom_cur_pop(char * restrict chrom1,__global char * restrict chrom2, int chrom_size)
{
       for (size_t i=0;i<chrom_size;i++)
                chrom1[i] = chrom2[i];
}

void copy_chrom_best_mem(__global char * restrict chrom1, char * restrict chrom2, int chrom_size)
{
        for (size_t i=0;i<chrom_size;i++)
                chrom1[i] = chrom2[i];
}

void copy_chrom(char * restrict chrom1, char * restrict chrom2, int chrom_size)
{
        for (size_t i=0;i<chrom_size;i++)
                chrom1[i] = chrom2[i];
}


int fit_fun(char * restrict chrom, int chrom_size)
{
        int sum=0;
     /*   for (size_t i=0;i<chrom_size-1;i++)
                sum += dst_mat[(unsigned char)chrom[i]][(unsigned char)chrom[i+1]];
        sum += dst_mat[(unsigned char)chrom[63]][64];
        sum += dst_mat[64][(unsigned char)chrom[0]];*/
        return sum;
}

void cross_over(char * restrict chrom, char * restrict chrom1, char * restrict chrom2, int chrom_size, double *random_set, int *random_set_index, int *num_random_remaining)
{
        int j;
        int cross_pt;
        int mask[CHROM_MAX];

        cross_pt=rnd_chrom(chrom_size, random_set, random_set_index, num_random_remaining);
        for (size_t i=0;i<chrom_size;i++)
                mask[i] = 0;

        j=0;

        for (size_t i=0;i<chrom_size;i++) {
                if (i<=cross_pt) {
                    chrom[i]=chrom1[i];
                    mask[(unsigned char)chrom1[i]] = 1; /* set mask */
                }
                else {
                    while (mask[(unsigned char)chrom2[j]]!=0)
                        j++;
                    chrom[i] = chrom2[j];
                    mask[(unsigned char)chrom2[j]]=1;
                }
        }
}
        

int rnd_chrom(int chrom_size, double *random_set, int *random_set_index, int *num_random_remaining)
{
        int num = 0;
        int rnd_index = get_rnd(1, *num_random_remaining, random_set[*random_set_index]);
        *random_set_index += 1;
        *num_random_remaining--;

//        do {
//                num = drand48()*chrom_size;
//        } while (num>=chrom_size);
//        return num;
        return rnd_index;
}

int rnd_member(int pop_size, double *random_set, int *random_set_index, int *num_random_remaining)
{
        int num = 0;
        int rnd_index = get_rnd(1, *num_random_remaining, random_set[*random_set_index]);
        *random_set_index += 1;
        *num_random_remaining--;

//    do {
  //      num = drand48()*pop_size;
  //  } while (num>=pop_size);

//    return num;
        return rnd_index;
}

int  get_rnd(int low,int high, double random)
{
    int i;

    if(low >= high) i = low;
    else
    {
        i = (int) (random*(high-low+1) + low);
        if(i > high) i = high;
    }
    return(i);
}

void mutate(char * chrom, int chrom_size, double *random_set, int *random_set_index, int *num_random_remaining);
{
        int mut_pt,insert_pt,chrom_hld;

        mut_pt=rnd_chrom(chrom_size, random_set, random_set_index, num_random_remaining);
        insert_pt=rnd_chrom(chrom_size, random_set, random_set_index, num_random_remaining)

        if (insert_pt>mut_pt){
                chrom_hld=chrom[mut_pt];
                for(int i=mut_pt;i<insert_pt;i++)
                        chrom[i]=chrom[i+1];
                chrom[insert_pt]=chrom_hld;
        }
        else {
                chrom_hld=chrom[mut_pt];
                for (size_t i=mut_pt;i>insert_pt;i--)
                        chrom[i]=chrom[i-1];
                chrom[insert_pt]=chrom_hld;
        }
}
