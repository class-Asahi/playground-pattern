cmake_minimum_required(VERSION 3.13)
project(Untitled)
include(CheckCXXCompilerFlag)

set(CMAKE_CXX_STANDARD 17)

check_cxx_compiler_flag("-std=c++14" COMPILER_SUPPORTS_CXX14)
check_cxx_compiler_flag("-std=c++17" COMPILER_SUPPORTS_CXX17)
check_cxx_compiler_flag("-std=c++2a" COMPILER_SUPPORTS_CXX20)

message(STATUS "[INFO] Detected C/C++ Compiler: ${CMAKE_CXX_COMPILER}")
if(COMPILER_SUPPORTS_CXX20)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}-std=c++2a")
    message(STATUS "[INFO] Your compiler is supported C++2a")
elseif(COMPILER_SUPPORTS_CXX17)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}-std=c++17")
    message(STATUS "[INFO] Your compiler is supported C++17")
else()
    message(ERROR "[ERR!] Detected compiler has no C++17 or newer support.")
endif()

set(INCLUDE_PATH ${PROJECT_SOURCE_DIR}/include)
include_directories(${INCLUDE_PATH})

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/build)

add_executable(Untitled ${PROJECT_SOURCE_DIR}/src/main.cc)