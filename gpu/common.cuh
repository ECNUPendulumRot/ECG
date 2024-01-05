
#ifndef ECG_COMMON_CUH
#define ECG_COMMON_CUH


#include <cstdio>


#define CHECK(call)                                                                                     \
do {                                                                                                    \
    const cudaError_t error_code = call;                                                                \
    if (error_code != cudaSuccess) {                                                                    \
        printf("CUDA Error: \n     FILE:  %s\n     LINE: %d, ", __FILE__, __LINE__);                    \
        printf("     Error Code: %d, \n     Reason: %s\n", error_code, cudaGetErrorString(error_code)); \
        exit(1);                                                                                        \
    }                                                                                                   \
} while (0)                                                                                             \


#ifdef USE_DP
    typedef double real;
    const real EPSILON = 1e-15;
#else
    typedef float real;
    const real EPSILON = 1.0e-6f;
#endif

#endif //ECG_COMMON_CUH
