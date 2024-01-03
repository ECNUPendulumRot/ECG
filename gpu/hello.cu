#include <cstdio>


__global__ void hello_from_gpu()
{
    printf("Hello World from GPU!\n");
}


int main()
{
    printf("Hello World!\n");
    return 0;
}