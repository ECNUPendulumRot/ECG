cmake_minimum_required(VERSION 3.26)

project(GPUEXAMPLES)

enable_language(CUDA)

message(CMAKE_CUDA_ARCHITECTURES: ${CMAKE_CUDA_ARCHITECTURES})

set(CMAKE_CXX_STANDARD 17)

set(ECGCU_HEADER_FILES
        common.cuh
)

add_executable(hello hello.cu common.cuh)
add_executable(add add.cu common.cuh)

add_executable(cuda_record cuda_record.cu common.cuh)

add_executable(query query.cu)
