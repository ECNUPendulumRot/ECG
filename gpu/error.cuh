
#ifndef ECG_ERROR_CUH
#define ECG_ERROR_CUH

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

#endif //ECG_ERROR_CUH
