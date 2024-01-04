cmake_minimum_required(VERSION 3.26)

project(GPUEXAMPLES)

enable_language(CUDA)

message(CMAKE_CUDA_ARCHITECTURES: ${CMAKE_CUDA_ARCHITECTURES})

set(CMAKE_CXX_STANDARD 17)

set(ECGCU_HEADER_FILES
    error.cuh
)

add_executable(hello hello.cu error.cuh)
add_executable(add add.cu error.cuh)