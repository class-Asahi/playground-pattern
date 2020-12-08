#!/bin/bash
set -e

raw_path=$(dirname $(readlink -f $0))
project_dir=${raw_path::-8}
cmake_dir=$project_dir/cmake
build_dir=$project_dir/build

echo -e "\e[1;36m[INFO] Starting build target Untitled. \e[0m"
/usr/bin/cmake --build $cmake_dir --target Untitled -- -j 4
echo -e "\e[1;36m[INFO] Target built in $build_dir/Untitled. \e[0m"