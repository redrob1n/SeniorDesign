#define TILE_WIDTH 256

// kernel program (vector add) 
 __kernel
   __attribute((reqd_work_group_size(TILE_WIDTH,1,1)))
   __attribute((num_vector_lanes(4)))
   void vadd(__global const float *restrict a,
      __global const float *restrict b, global float *restrict result, const int N) { 
         int id = get_global_id(0); 
         if (id < N) result[id] = a[id] + b[id];
   }
