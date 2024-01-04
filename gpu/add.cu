#include <cmath>
#include <cstdio>

#include "error.cuh"

const double EPSILON = 1.0e-15;
const double a = 1.23;
const double b = 2.34;
const double c = 3.57;

// 核函数的返回值必须是 void
// 必须要__global__， 可以使用static
// 不可以使用可变参数
// 非指针变量对每一个线程可见
// 除非使用统一内存，否则传入的指针必须是设备内存指针
__global__ void add(const double *x, const double *y, double *z, int N);
__device__ void add_device(double x, double y, double *z);
void check(const double *z, int N);

int main()
{
    const int N = 100000000;
    const int M = sizeof(double) * N;
    double *h_x = (double*) malloc(M);
    double *h_y = (double*) malloc(M);
    double *h_z = (double*) malloc(M);

    for (int n = 0; n < N; ++n) {
        h_x[n] = a;
        h_y[n] = b;
    }

    double *d_x, *d_y, *d_z;
    CHECK(cudaMalloc(&d_x, M));
    cudaMalloc(&d_y, M);
    cudaMalloc(&d_z, M);
    cudaMemcpy(d_x, h_x, M, cudaMemcpyHostToDevice);
    cudaMemcpy(d_y, h_y, M, cudaMemcpyHostToDevice);

    const int block_size = 128;

    // 即使不能够整除也能够执行
    const int grid_size = (N - 1) / block_size + 1;
    add<<<grid_size, block_size>>>(d_x, d_y, d_z, N);

    // 检查核函数是否出错
    // 例如将线程数量设的足够大就会报错
    CHECK(cudaGetLastError());
    CHECK(cudaDeviceSynchronize());

    cudaMemcpy(h_z, d_z, M, cudaMemcpyDeviceToHost);
    check(h_z, N);

    free(h_x);
    free(h_y);
    free(h_z);
    cudaFree(d_x);
    cudaFree(d_y);
    cudaFree(d_z);
    return 0;
}


__global__ void add(const double *x, const double *y, double *z, int N) {
    const int n = blockIdx.x * blockDim.x + threadIdx.x;
    if (n < N)
        add_device(x[n], y[n], &z[n]);
}

__device__ void add_device(const double x, const double y, double *z) {
    *z = x + y;
}

void check(const double *z, const int N) {
    bool has_error = false;
    for (int n = 0; n < N; ++n) {
        if (fabs(z[n] - c) > EPSILON) {
            has_error = true;
        }
    }
    printf("%s\n", has_error ? "Has errors" : "No errors");
}