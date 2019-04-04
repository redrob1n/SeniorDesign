// very simple vector add example used in class
// --everything is in one *.cpp *program
// --no *error checking; not a good idea

using namespace std;
#include <iostream>
#include <stdlib.h>

#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <sys/time.h>
// include files
#include <CL/cl.h>

#define TILE_WIDTH      256
#define POP_MAX         512
#define CHROM_MAX       65
#define CHROM_SIZE      64
#define SEED            347834
#define CROSS_PROB      0.85
#define MUT_PROB        0.05      
#define MIN_MUT_FUN     1000000


// iceil macro
// returns an integer ceil value where integer numerator is first parameter
// and integer denominator is the second parameter. iceil is the rounded
// up value of numerator/denominator when there is a remainder
// equivalent to ((num%den!=0) ? num/den+1 : num/den)
#define iceil(num,den) (num+den-1)/den 

void chrom_init(char *, int );
void kernel_init(cl_context*, cl_program*, cl_command_queue* , cl_int *err);
void initialize(int);
unsigned char* LoadBinProgramFromFile(const char*, size_t *);
void print_city_visit_order(char *, int );

//=======================================================================
//  Description: Load OpenCL kernel executable/binary file into a single
//                                  C type string for compilation
//                                  this *program was compiled offline
//=======================================================================
unsigned char* LoadBinProgramFromFile(const char* fileName,
        size_t * binary_length) {

        *binary_length = 0;

        FILE* fp = fopen(fileName, "rb");
        if (fp == NULL) {
                printf("Failed to open \"%s\" file (fopen).\n",fileName);
                return (unsigned char *) '\0';
        }
        fseek(fp, 0, SEEK_END);
        *binary_length = ftell(fp);
        unsigned char *KernelBin = (unsigned char*) malloc(sizeof(unsigned char)* *binary_length);
        if(KernelBin==0) {
                printf("Malloc Failed!!\n");
                return (unsigned char *) '\0';
        }
        rewind(fp);
        if (fread((void*)KernelBin, *binary_length, 1, fp) == 0) {
                printf("Failed to read from \"%s\" file (fread).\n",fileName);
                return (unsigned char *) '\0';
        }
        fclose(fp);
        return KernelBin;
}


////////////////////////////////////////////////////////////
// Initializes the chromosome for the first population by using
// rnd_chrom()to swap elements (chosen by a random number between 0-64)
// [ARG1] - character array chrom
////////////////////////////////////////////////////////////
void chrom_init(char * chrom, int chrom_size)
{
    int index1,index2,temp;
    for (int i=0;i<chrom_size;i++)
    {
        chrom[i]=i;
    }

    /* swap elements */
    for (int i=0;i<chrom_size;i++)
    {
        do {  index1 = drand48()*chrom_size; } while (index1>=chrom_size);
        do {  index2 = drand48()*chrom_size; } while (index2>=chrom_size);
        temp = chrom[index1];
        chrom[index1]=chrom[index2];
        chrom[index2]=temp;
    }
}

////////////////////////////////////////////////////////////
// This function initializes the first generations populatiotv2n
//     by calling chrom_init() 512(population size) number
//    of times. It passes a pointer to a ‘chromosome’ which
//    is represented as a subset of the population array
//    (i.e. current_pop[0:64] is chrom1 [65:128] chrom2 etc)
//    which is offset by 65*i within the population array.
////////////////////////////////////////////////////////////
void initialize(char* pop1, char*pop2, int pop_size)
{
    //Command Line Hints
    for (int i=0;i<pop_size;i++)
    {
        chrom_init(pop1+i*CHROM_MAX, CHROM_MAX);
        chrom_init(pop2+i*CHROM_MAX, CHROM_MAX);
    }
}

////////////////////////////////////////////////////////////
// Prints the order of the cities visited
// [ARG1] - *chrom: A single chromosome represented as an
//            ordered list of cities
////////////////////////////////////////////////////////////
void print_city_visit_order(char *chrom, int chrom_size)
{
    for (int i=0;i<chrom_size;i++)
    {
        cout << "[City " << chrom[i] << "]->"; 
    }
    cout << "[City " << chrom_size << "]->[City " << chrom[0]; 

}

int main (int argc, char **argv) {

        //*****************************************************
        // Initialize algorithm variables        
        //*****************************************************
        int pop_size, chrom_size, num_gen, prob_cross, prob_mut, min_fit_fun;

        if (argc != 2)  pop_size = POP_MAX;
        else            pop_size = atoi(argv[2]);
        chrom_size = CHROM_SIZE;
        num_gen = NUM_GEN;
        prob_cross = CROSS_PROB;
        prob_mut = MUT_PROB;
        min_fit_fun = MIN_MUT_FUN;

        int N = pop_size*CHROM_MAX;
        int pop_size_bytes = N*sizeof(char);
        
        char *parent1 = new char[CHROM_MAX];
        char *parent2 = new char[CHROM_MAX];
        char *best_member = new char[CHROM_MAX];
        srand48(SEED);
        
	char *pop1 = new char[N];        // allocate and initialize host (CPU) memory
	char *pop2 = new char[N];        // allocate and initialize host (CPU) memory
        char *current_pop = &pop1[0];
        char *next_pop = &pop2[0];
        initialize(pop1, pop2, pop_size); //defined above
        
        //*****************************************************
        // Initialize FPGA Variables, Kernel and Context
        // Compilel Kernel Program
        // --kernel_init() gets the platform, sets up context
        //             creates cmd queue and compiles program
        //*****************************************************
        
        cl_mem fp_pop1, fp_pop2;          // pointers to fpga memory
        cl_context context;
        cl_program program;
        cl_command_queue CmdQueue;    //Command Queue
        cl_int clerr;
        cl_kernel Kernel[1];  

        kernel_init(&context, &program, &CmdQueue, &clerr);
        Kernel[0]= clCreateKernel(program, "emulated", &clerr); // create kernel from *program
        
        // allocate fpga memory for pop1 and pop2 arrays, send pop1 and pop2 to device
        fp_pop1 = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, pop_size_bytes, pop1, NULL);
        fp_pop2 = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, pop_size_bytes, pop2, NULL);

        //*****************************************************
        // Prepare Kernel for Execution
        //*****************************************************
                
        // place kernel arguments in the command queue
        clerr= clSetKernelArg(Kernel[0], 0,sizeof(cl_mem), (void *) &fp_pop1);
        clerr= clSetKernelArg(Kernel[0], 1,sizeof(cl_mem), (void *) &fp_pop2);
        clerr= clSetKernelArg(Kernel[0], 2,sizeof(int), (void *) &N);
        clerr= clSetKernelArg(Kernel[0], 3,sizeof(int), (void *) &N);
        clerr= clSetKernelArg(Kernel[0], 4,sizeof(int), (void *) &N);
        clerr= clSetKernelArg(Kernel[0], 5,sizeof(int), (void *) &N);
        clerr= clSetKernelArg(Kernel[0], 6,sizeof(int), (void *) &N);
        clerr= clSetKernelArg(Kernel[0], 7,sizeof(int), (void *) &N);
        clerr= clSetKernelArg(Kernel[0], 8,sizeof(int), (void *) &N);
        

        // set workgroup size -- make global dimensions a multiple of the workspace
        size_t cl_DimBlock[1]={TILE_WIDTH};
        size_t cl_DimGrid[1]= {iceil(N,TILE_WIDTH)*TILE_WIDTH};

        cl_event event=NULL;
        
        //*****************************************************
        // Execute Genetic
        //*****************************************************
        // launch kernel
        clerr= clEnqueueNDRangeKernel(CmdQueue,Kernel[0], 1, NULL,  cl_DimGrid, cl_DimBlock,0, NULL, &event);
        clerr= clWaitForEvents(1, &event); // wait for kernel to complete

        // send C data back to host and print result
        clEnqueueReadBuffer(CmdQueue, fp_pop1, CL_TRUE, 0, size, pop1, 0, NULL, NULL);
       // print_city_visit_order(best_member, pop_size); //THHIS IS WHERE THE *errOR IS
        
        // clean up memory
        free(pop1);
        free(pop2);        
        clReleaseMemObject(fp_pop1);
        clReleaseMemObject(fp_pop2);

	printf("Execution Complete \n");
}

////////////////////////////////////////////////////////////
// This is the stuff that we are not sure if we are supposed
// to change or not
////////////////////////////////////////////////////////////
void kernel_init(cl_context* context, cl_program* program, cl_command_queue *cmd_queue, cl_int *err)
{

        // declare operation *error variable -- not used in this example but -- should be used in a real *program
        *err = CL_SUCCESS;
        cl_int kernerr = CL_SUCCESS;

        // get valid platform
        cl_uint numPlatforms;
        *err = clGetPlatformIDs(0, NULL, &numPlatforms);
        cl_platform_id *platforms;
        platforms = new cl_platform_id[numPlatforms];
        *err = clGetPlatformIDs(numPlatforms, platforms, NULL);

        // set up a FPGA *context
        *context=NULL; 
        for (unsigned int i=0;i<numPlatforms;i++) {
                cl_context_properties cprops[3];
                cprops[0] = CL_CONTEXT_PLATFORM;
                cprops[1] = (cl_context_properties) platforms[i];
                cprops[2] = 0;
                *context=clCreateContextFromType(cprops, CL_DEVICE_TYPE_ACCELERATOR, NULL, NULL, &*err);
                if (*err == CL_SUCCESS) break; // stop at first platform that has the Specified type
                if (i==numPlatforms-1) {
                        printf("No Platform Found!\n");
                        break;
                }
        }

        size_t parmsz;
        *err= clGetContextInfo(*context, CL_CONTEXT_DEVICES, 0, NULL, &parmsz);

        // obtain first valid device
        cl_device_id* Devices= new cl_device_id[parmsz]; 
        *err= clGetContextInfo(*context, CL_CONTEXT_DEVICES, parmsz, Devices, NULL); 

        // create the command queue
        *cmd_queue=clCreateCommandQueue(*context, Devices[0], 0, &*err); 

        // Load Precompiled kernel *program 
        size_t CodeBinSize;
        unsigned char *ga_bin = NULL;
        ga_bin=LoadBinProgramFromFile("emulated.aocx",&CodeBinSize); //the aocx file is the fpga image file, which contains all kernel files & fpga
       // ga_bin=LoadBinProgramFromFile("main/libkernel.so",&CodeBinSize); 


        *program = clCreateProgramWithBinary(*context, 1, Devices, &CodeBinSize, (const unsigned char**) &ga_bin, &kernerr, &*err);
        switch(*err)
        {
                case CL_INVALID_CONTEXT: printf("INVALID_CONTEXT\n");break;
                case CL_INVALID_VALUE: printf("INVALID_VALUE\n");break;
                case CL_INVALID_DEVICE: printf("INVALID_DEVICE\n");break;
                case CL_INVALID_BINARY: printf("INVALID_BINARY\n");break;
                case CL_OUT_OF_HOST_MEMORY: printf("OUT_OF_HOST_MEMORY\n");break;
                default: break;
        }
        
        switch(kernerr)
        {
                case CL_INVALID_VALUE: printf("kernerr INVALID_VALUE\n");break;
                case CL_INVALID_BINARY: printf("kernerr INVALID_BINARY\n");break;
                default: break;
        }
        if (kernerr != CL_SUCCESS || *err != CL_SUCCESS) {
                printf("Cannot Create *program from Binary! \n");
                exit(1);
        }
        free(ga_bin);
        
        // compile *program
        *err= clBuildProgram(*program, 1, &Devices[0], "-cl-mad-enable", NULL, NULL);
}




