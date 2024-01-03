cmake_minimum_required(VERSION 3.26)

set(CMAKE_CXX_STANDARD 17)

set(ECG_HEADER_FILES
    convex_hull/ConvexHull.hpp
    convex_hull/SimpleConvexHull.hpp
        base/types.hpp
)

set(ECG_SOURCE_FILES
    convex_hull/ConvexHull.cpp
    convex_hull/SimpleConvexHull.cpp
)

add_library(ecg_lib ${ECG_SOURCE_FILES} ${ECG_HEADER_FILES})

target_include_directories(ecg_lib
        PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)

add_executable(ECG main.cpp)