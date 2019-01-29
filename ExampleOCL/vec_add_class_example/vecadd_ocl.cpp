// very simple vector add example used in class
// --everything is in one *.cpp program
// --no error checking; not a good idea

using namespace std;
#include <iostream>
#include <stdlib.h>
// include files
#include <CL/cl.h>

#define TILE_WIDTH 256

// iceil macro
// returns an integer ceil value where integer numerator is first parameter
// and integer denominator is the second parameter. iceil is the rounded
// up value of numerator/denominator when there is a remainder
// equivalent to ((num%den!=0) ? num/den+1 : num/den)
#define iceil(num,den) (num+den-1)/den 

// Basic CPU based vecAdd C = A+B implementation
// Replaced by FPGA function with identical name
// (commented out here!)
/*
void vecAdd (float *A, float *B, float *C, int n) {
   int i;
   for (i=0;i<n;i++) C[i] = A[i] + B[i];
}
*/

#include <stdlib.h>
#include <stdio.h>
//=======================================================================
//  Description: Load OpenCL kernel executable/binary file into a single
//              C type string for compilation
//              this program was compiled offline
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
   unsigned char *KernelBin = (unsigned char*) malloc(sizeof(unsigned char)
                                * *binary_length);
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

int main (int argc, char **argv) {

   int N;    // vector entries
   int size; // vector size in bytes

   if (argc != 2) {
      cout << "usage: vectoradd <vector size>" << endl;
      exit(1);
   }

   N = atoi(argv[1]);
   size = N*sizeof(float); // vector sizes in bytes
   
   // allocate and initialize host (CPU) memory
   float *A = new float[N];
   float *B = new float[N];
   float *C = new float[N];

   // load vectors A and B with sample data
   for (int i=0;i<N;i++) A[i]=B[i]=(float) i;

   // declare device (FPGA) memory pointers
   cl_mem d_A,d_B,d_C;

   // declare operation error variable -- not used in this example but
   //                                  -- should be used in a real program
   cl_int clerr = CL_SUCCESS,kernerr = CL_SUCCESS;

   // get valid platform
   cl_uint numPlatforms;
   clerr = clGetPlatformIDs(0, NULL, &numPlatforms);
   cl_platform_id *platforms;
   platforms = new cl_platform_id[numPlatforms];
   clerr = clGetPlatformIDs(numPlatforms, platforms, NULL);

   // set up a FPGA context
   cl_context OCL_Context=NULL; 
   for (unsigned int i=0;i<numPlatforms;i++) {
      cl_context_properties cprops[3];
      cprops[0] = CL_CONTEXT_PLATFORM;
      cprops[1] = (cl_context_properties) platforms[i];
      cprops[2] = 0;
      OCL_Context=clCreateContextFromType(cprops, CL_DEVICE_TYPE_ACCELERATOR, 
         NULL, NULL, &clerr);
      if (clerr == CL_SUCCESS) break; // stop at first platform that has the Specified type
      if (i==numPlatforms-1) {
         printf("No Platform Found!\n");
         break;
      }
   }

   size_t parmsz;
   clerr= clGetContextInfo(OCL_Context, CL_CONTEXT_DEVICES, 0, NULL, 
      &parmsz);

   // obtain first valid device
   cl_device_id* OCL_Devices= new cl_device_id[parmsz]; 
   clerr= clGetContextInfo(OCL_Context, CL_CONTEXT_DEVICES, parmsz,
      OCL_Devices, NULL); 

   // create the command queue
   cl_command_queue OCL_CmdQueue=clCreateCommandQueue(OCL_Context,
   OCL_Devices[0], 0, &clerr); 

   // Load Precompiled kernel program 
   size_t CodeBinSize;
   unsigned char *vaddbin = NULL;
   vaddbin=LoadBinProgramFromFile("vadd.aocx",&CodeBinSize);

   cl_program OCL_Program;
   OCL_Program = clCreateProgramWithBinary(OCL_Context, 1, OCL_Devices,
      &CodeBinSize, (const unsigned char **) &vaddbin, &kernerr, &clerr);
   if (kernerr != CL_SUCCESS || clerr != CL_SUCCESS) {
      printf("Cannot Create program from Binary! \n");
      exit(1);
   }
   free(vaddbin);

   // compile program
   clerr= clBuildProgram(OCL_Program, 1, &OCL_Devices[0], "-cl-mad-enable",
       NULL, NULL);

   // create kernel from program
   cl_kernel OCL_Kernel[1]; // one or more kernels
   OCL_Kernel[0]= clCreateKernel(OCL_Program, "vadd", &clerr); 

   // allocate device memory for the A, B, and C arrays.
   // send A and B data to device
   d_A = clCreateBuffer(OCL_Context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
      size, A, NULL);
   d_B = clCreateBuffer(OCL_Context, CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR, 
      size, B, NULL);
   d_C = clCreateBuffer(OCL_Context, CL_MEM_WRITE_ONLY, size, 
      NULL, NULL);

   //commands that could be used to transfer data from host to device but are
   //unecessary because you can create and write memory using the clCreateBuffer
   //command with the CL_MEM_READ_ONLY | CL_MEM_COPY_HOST_PTR flags
   // clEnqueueWriteBuffer(OCL_CmdQueue, d_A, CL_FALSE,0,size,
   //   (const void * )A, 0, 0, NULL);
   // clEnqueueWriteBuffer(OCL_CmdQueue, d_B, CL_FALSE, 0, size, 
   //      (const void *)B, 0, 0, NULL);

   // place kernel arguments in the command queue
   clerr= clSetKernelArg(OCL_Kernel[0], 0,sizeof(cl_mem), (void *) &d_A);
   clerr= clSetKernelArg(OCL_Kernel[0], 1,sizeof(cl_mem), (void *) &d_B);
   clerr= clSetKernelArg(OCL_Kernel[0], 2,sizeof(cl_mem), (void *) &d_C);
   clerr= clSetKernelArg(OCL_Kernel[0], 3,sizeof(int), (void *) &N);
   // set workgroup size -- make global dimensions a multiple of the workspace
   size_t cl_DimBlock[1]={TILE_WIDTH},
          cl_DimGrid[1]= {iceil(N,TILE_WIDTH)*TILE_WIDTH};

   cl_event event=NULL;

   // launch kernel
   clerr= clEnqueueNDRangeKernel(OCL_CmdQueue,OCL_Kernel[0], 1, NULL, 
      cl_DimGrid, cl_DimBlock,0, NULL, &event);
   clerr= clWaitForEvents(1, &event); // wait for kernel to complete

   // send C data back to host
   clEnqueueReadBuffer(OCL_CmdQueue, d_C, CL_TRUE, 0, size, C, 0, 
      NULL,NULL);

   // output final results
   for (int i=0;i<N;i++) cout << "C[" << i << "]=" << C[i] << endl;

   // free host memory
    free(A); free(B); free(C);

   // free device memory objects
   clReleaseMemObject(d_A);
   clReleaseMemObject(d_B);
   clReleaseMemObject(d_C);
}
