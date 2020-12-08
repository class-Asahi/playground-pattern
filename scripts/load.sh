#!/bin/bash
set -e

raw_path=$(dirname $(readlink -f $0))
project_dir=${raw_path::-8}
cmake_dir=$project_dir/cmake

if test -d $cmake_dir; then
    rm -rf $cmake_dir
    echo -e "\e[1;33m[WARN] Old CMake files have been clean up. \e[0m"
fi    
mkdir $cmake_dir
echo -e "\e[1;36m[INFO] Performing CMake at $cmake_dir. \e[0m"
(cd $cmake_dir && /usr/bin/cmake -DCMAKE_BUILD_TYPE=Debug -G "CodeBlocks - Unix Makefiles" $project_dir)