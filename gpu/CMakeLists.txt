cmake_minimum_required(VERSION 3.26)

project(GPUEXAMPLES)

enable_language(CUDA)

message(CMAKE_CUDA_ARCHITECTURES: ${CMAKE_CUDA_ARCHITECTURES})

set(CMAKE_CXX_STANDARD 17)

add_executable(hello hello.cu)