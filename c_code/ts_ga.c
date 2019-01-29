/* BASE TSP DISTANCE MATRIX FOR TEST 65 City   */
/* Problem                                     */
/* B. Earl Wells -- 6/5/04 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <sys/time.h>

#define POP_MAX 512
#define CHROM_MAX 65

char pop1[POP_MAX*CHROM_MAX];
char pop2[POP_MAX*CHROM_MAX];
char *current_pop = &pop1[0];
char *next_pop = &pop2[0];

#define Cur_pop(i,j) *(current_pop+i*CHROM_MAX+j)
#define Cur_pop_chrom(i) (current_pop+i*CHROM_MAX)
#define Next_pop(i,j) *(next_pop+i*CHROM_MAX+j)

/* Major Simulation Parameters */
int chrom_size = 64;
int seed = 347834;
int pop_size = 512;
int num_gen = 0; //Defined by arguments
double prob_cross = 0.85;
double prob_mut = 0.05;
int min_fit_fun = 1000000;


/* modified from mpbench */
#define TIMER_CLEAR_GEN         (tv1.tv_sec = tv1.tv_usec = tv2.tv_sec = tv2.tv_usec = 0)
#define TIMER_START_GEN         gettimeofday(&tv1, (struct timezone*)0)
#define TIMER_STOP_GEN          gettimeofday(&tv2, (struct timezone*)0)
#define PRINT_TIME_GEN(gen)     fprintf(csvDataFile,"%i,%i, %6.3f\n",0,gen, (double)tv2.tv_usec-tv1.tv_usec)

#define TIMER_CLEAR_EXE         (tv3.tv_sec = tv3.tv_usec = tv4.tv_sec = tv4.tv_usec = 0)
#define TIMER_START_EXE         gettimeofday(&tv3, (struct timezone*)0)
#define TIMER_STOP_EXE          gettimeofday(&tv4, (struct timezone*)0)
#define PRINT_TIME_EXE          fprintf(csvDataFile,"%i, %6.3f\n",1, (double)tv4.tv_usec-tv3.tv_usec)


struct timeval tv1,tv2;
struct timeval tv3,tv4;
FILE *csvDataFile;
FILE *txtDataFile;
char *resultsDir = "results/";
char *dataStr = "data/";
char *solutionsStr = "solutions/";
char *csvStr = ".csv";
char *txtStr = ".txt";
char *genStr = "gen_";

////////////////////////////////////////////////////////////
//    2D array of all distances from each “node/destination”
////////////////////////////////////////////////////////////
int dst_mat[65][65]= {
#include "coords.h"
};



////////////////////////////////////////////////////////////
// Calculate the total fitness of one chromosome
// [ARG1] - character array chrom
// [RETURN] - int sum
////////////////////////////////////////////////////////////
int fit_fun(char * chrom)
{
    int sum=0;
    for (size_t i=0;i<chrom_size-1;i++)
    {
        sum += dst_mat[(unsigned char)chrom[i]][(unsigned char)chrom[i+1]];
    }
    sum += dst_mat[(unsigned char)chrom[63]][64];
    sum += dst_mat[64][(unsigned char)chrom[0]];
    return sum;
}



////////////////////////////////////////////////////////////
// Prints the order of the cities visited
// [ARG1] - *chrom: A single chromosome represented as an
//            ordered list of cities
////////////////////////////////////////////////////////////
void print_city_visit_order(char *chrom)
{
    for (size_t i=0;i<chrom_size;i++)
    {
        fprintf(txtDataFile,"[City %d]->",chrom[i]);
    }
    fprintf(txtDataFile,"[City %d]->[City %d]\n",chrom_size,chrom[0]);
}



////////////////////////////////////////////////////////////
// Function to print out the city order from a single
//     chromosome
// [ARG1] - *chrom: A single chromosome represented as an
//            ordered list of cities
////////////////////////////////////////////////////////////
void print_chrom(char *chrom)
{
    for (size_t i=0;i<chrom_size;i++)
    {
        printf("%d",chrom[i]);
    }
    printf("\n");
}



////////////////////////////////////////////////////////////
//Description - Returns random value between 0 and 64(chrome_size) as a
//    positive integer
// [RETURN] - num
////////////////////////////////////////////////////////////
int rnd_chrom(void)
{
    int num;
    do {
        num = drand48()*chrom_size;
    } while (num>=chrom_size);
    return num;
}



////////////////////////////////////////////////////////////
// Initializes the chromosome for the first population by using
// rnd_chrom()to swap elements (chosen by a random number between 0-64)
// [ARG1] - character array chrom
////////////////////////////////////////////////////////////
void chrom_init(char * chrom)
{
    int index1,index2,temp;
    for (size_t i=0;i<chrom_size;i++)
    {
        chrom[i]=i;
    }

    /* swap elements */
    for (size_t i=0;i<chrom_size;i++)
    {
        index1=rnd_chrom();
        index2=rnd_chrom();
        temp = chrom[index1];
        chrom[index1]=chrom[index2];
        chrom[index2]=temp;
    }
}



////////////////////////////////////////////////////////////
// Prints a chromosome array based on the chromosome size
// [ARG1] - chrom (character array)
////////////////////////////////////////////////////////////
void pp(char * chrom)
{
    for (size_t j=0;j<chrom_size;j++)
    {
        printf("%d, ",chrom[j]);
    }
    printf("\n\n");
}


////////////////////////////////////////////////////////////
// This function initializes the first generations populatiotv2n
//     by calling chrom_init() 512(population size) number
//    of times. It passes a pointer to a ‘chromosome’ which
//    is represented as a subset of the population array
//    (i.e. current_pop[0:64] is chrom1 [65:128] chrom2 etc)
//    which is offset by 65*i within the population array.
////////////////////////////////////////////////////////////
void initialize(void)
{
    //Command Line Hints
    for (size_t i=0;i<pop_size;i++)
    {
        chrom_init(Cur_pop_chrom(i));
    }
}



////////////////////////////////////////////////////////////
//Description: Returns random value between 0 and 512(pop_size) as a non //negative, double precision,
// floating point value uniformly distributed over the interval [0.0,1.0)
// [ARG] - none
// [RETURN] - num
////////////////////////////////////////////////////////////
int rnd_member(void)
{
    int num;
    do {
        num = drand48()*pop_size;
    } while (num>=pop_size);

    return num;
}



////////////////////////////////////////////////////////////
// print each chromosome path for every population
// Not used in the original main function
////////////////////////////////////////////////////////////
void ppp(void)
{
    for (size_t i=0;i<pop_size;i++)
    {
        for (size_t j=0;j<chrom_size;j++)
        {
            printf("%d ",Cur_pop(i,j));
        }
        printf("\n\n");

    }
}



////////////////////////////////////////////////////////////
// Makes a copy of the values in chrom1 and adds them to chrom2
// [ARG1] - chrom1
// [ARG2…] - chrom2
////////////////////////////////////////////////////////////
void copy_chrom(char *chrom1,char *chrom2)
{
    for (size_t i=0;i<chrom_size;i++)
    {
        chrom1[i] = chrom2[i];
    }
}



////////////////////////////////////////////////////////////
// When creating the new generation, this function is called
//    to randomly select two parents from the current population
//     (represented as can1 and can2) and compare the two parents
//    fitness level. Whichever parent is more fit is chosen to
//    be copied into the new generation, to move on to the
//    cross over stage
////////////////////////////////////////////////////////////
void get_parent(char * chrom)
{
    char can1[CHROM_MAX];
    char can2[CHROM_MAX];
    copy_chrom(can1,Cur_pop_chrom(rnd_member()));

    copy_chrom(can2,Cur_pop_chrom(rnd_member()));

    if (fit_fun(can1)<fit_fun(can2))
    {
        copy_chrom(chrom,can1);
    }
    else
    {
        copy_chrom(chrom,can2);
    }
}



////////////////////////////////////////////////////////////
// This function produces a new chromosome from two parent
//     chromosomes. The output of this function is the pointer
//    argument [char* chrom] which will point to the new
//    chromosome. A random crossover point is generated and
//    assigned as cross_pt. For all ‘genes’ lower than thechar
//    crossover point, the child ‘genes’ are copied from
//    parent 1. As each gene is copied into the child (chrom)
//    the mask[] keeps track of which ‘genes’ exist in the
//    child so as to prevent duplicate genes. After the crossover
//    point is reached, chrom2[] is iterated through and
//    searched for ‘genes’ that do not exist yet in the child.
//    These ‘genes’ are then copied over from chrom2[] into the child
//    in the order they appear in within chrom2[]
//
// [ARG1] - (char* chrom) The product of the crossover, output
// [ARG2…]- (char* chrom1) Parent 1 of the child
// [ARG3] - (char* chrom2) Parent 2 of the child
////////////////////////////////////////////////////////////
void cross_over(char * chrom, char * chrom1,char * chrom2)
{
    int j;
    int cross_pt;
    int mask[CHROM_MAX];

    cross_pt=rnd_chrom();
    for (size_t i=0;i<chrom_size;i++)
    {
        mask[i] = 0;
    }

    j=0;

    for (size_t i=0;i<chrom_size;i++)
    {
        if (i<=cross_pt)
        {
            chrom[i]=chrom1[i];
            mask[(unsigned char)chrom1[i]] = 1; /* set mask */
        }
        else
        {
            while (mask[(unsigned char)chrom2[j]]!=0)
            {
                j++;
            }
            chrom[i] = chrom2[j];
            mask[(unsigned char)chrom2[j]]=1;
        }
    }
}



////////////////////////////////////////////////////////////
// Sets mut_pt and insert_pt to the values returned by the rnd_chrom
//     function. Depending on the comparison of those values, it picks a
//    random segment of the chromosome and shifts it either up or down by
//    one.
// [ARG1] - chrom
////////////////////////////////////////////////////////////
void mutate(char * chrom)
{
    int mut_pt,insert_pt,chrom_hld;

    mut_pt=rnd_chrom();
    insert_pt=rnd_chrom();

    if (insert_pt>mut_pt)
    {
        chrom_hld=chrom[mut_pt];
        for(int i=mut_pt;i<insert_pt;i++)
        {
            chrom[i]=chrom[i+1];
        }
        chrom[insert_pt]=chrom_hld;
    }
    else
    {
        chrom_hld=chrom[mut_pt];
        for (size_t i=mut_pt;i>insert_pt;i--)
        {
            chrom[i]=chrom[i-1];
        }
        chrom[insert_pt]=chrom_hld;
    }
}



int main(int argc, char**argv)
{
    if(argc < 4)
    {
        printf("To few arguments \n");
        printf("Arg[1] -- num of generations\n");
        printf("Arg[2] -- test number\n");
	printf("Arg[3] -- seed \n");
        exit(1);
    }

    num_gen = atoi(argv[1]);
    seed = atoi(argv[3]);

    char parent1[CHROM_MAX];
    char parent2[CHROM_MAX];
    char best_member[CHROM_MAX];
    int cur_obj;
    char *temp_ptr;
    srand48(seed);
    double *gen_exe_time = malloc(num_gen*sizeof(double));

    if(gen_exe_time == NULL)
    {
        printf("Malloc Error, Aborting");
        exit(1);
    }
    //subfile path "results/gen_50/
    //csvFilePath "results/gen_50/data/test1.csv
    //csvFilePath "results/gen_50/solutions/test1.txt
    char subFilePath[sizeof(resultsDir) + sizeof(genStr) + sizeof(argv[1])+2];
    char csvFilePath[sizeof(subFilePath) + sizeof(dataStr)+sizeof(argv[2])+sizeof(csvStr) +1];
    char textFilePath[sizeof(subFilePath) + sizeof(solutionsStr)+sizeof(argv[2])+sizeof(csvStr)+1];
    char first[sizeof(argv[2])+1];
    char second[sizeof(argv[2])+1];

    strcpy(first,argv[2]);
    strcpy(second,argv[2]);

    strcpy(subFilePath,resultsDir);     // start with 'results/'
    strcat(subFilePath, genStr);        // results/gen_
    strcat(subFilePath, argv[1]);       // results/gen_50
    strcat(subFilePath, "/");           // results/gen_50/

    strcpy(csvFilePath, subFilePath);   // results/gen_50/
    strcat(csvFilePath, dataStr);       // results/gen_50/data/
    strcat(csvFilePath, first);       // results/gen_50/data/test1
    strcat(csvFilePath, csvStr);        // results/gen_50/data/test1.csv

	// solutionsStr
    strcpy(textFilePath, subFilePath);  // results/gen_50/
    strcat(textFilePath, solutionsStr);  // results/gen_50/solutions/
    strcat(textFilePath, second);      // results/gen_50/solutions/test1
    strcat(textFilePath, txtStr);       // results/gen_50/solutions/test1.txt


    csvDataFile = fopen(csvFilePath, "w");
    txtDataFile = fopen(textFilePath, "w");

    if(csvDataFile == NULL)
    {
        printf("error opening csv file");
        exit(1);
    }

    if(txtDataFile == NULL)
    {
        printf("error opening txt file");
        exit(1);
    }

    fprintf(csvDataFile,"type[generational = 0; total_execution=1], generation, time[microseconds]\n");

    initialize();



    /*
       Start recording the execution time
       */
    TIMER_CLEAR_EXE;
    TIMER_CLEAR_GEN;
    TIMER_START_EXE;
    TIMER_START_GEN;

    for (size_t i=0;i<num_gen;i++)
    {
        TIMER_START_GEN;
        for (size_t j=0;j<pop_size;j++)
        {
            /* Selection */
            get_parent(parent1);
            if (prob_cross<drand48())
            {
                /* Selection */
                get_parent(parent2);
                /* Cross over */
                cross_over(parent1,parent1,parent2);
            }

            /* Mutation */
            if (prob_mut<drand48())
            {
                mutate(parent1);
            }

            for (size_t k=0;k<chrom_size;k++)
            {
                Next_pop(j,k) = parent1[k];
            }

            /* Fitness */
            cur_obj = fit_fun(parent1);

            if (cur_obj<min_fit_fun)
            {
                min_fit_fun=cur_obj;
                copy_chrom(best_member,parent1);
            }

        }
        /*Replacement*/
        temp_ptr = current_pop;
        current_pop = next_pop;
        next_pop = temp_ptr;

        TIMER_STOP_GEN;
        PRINT_TIME_GEN((int)i);
        TIMER_CLEAR_GEN;
    }

    //  stop recording the execution time
    TIMER_STOP_EXE;
    PRINT_TIME_EXE;

    print_city_visit_order(best_member); //THHIS IS WHERE THE ERROR IS
    printf("Tour Cost = %d\n",min_fit_fun);
    free(gen_exe_time);

    fclose(csvDataFile);
    fclose(txtDataFile);

    return 0;
}
