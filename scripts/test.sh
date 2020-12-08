#!/bin/bash
set -e

raw_path=$(dirname $(readlink -f $0))
project_dir=${raw_path::-8}
cmake_dir=$project_dir/cmake
build_dir=$project_dir/build
test_dir=$project_dir/tests
out_dir=$project_dir/log
exec_dir=$build_dir/Untitled

/usr/bin/cmake --build $cmake_dir --target Untitled -- -j 4
set +e 
echo -e "\e[1;36m[INFO] Target built, start executable directly. \e[0m"

default_in=$test_dir/in.txt
default_out=$out_dir/out.txt
default_err=$out_dir/err.txt

(test -f $default_in) || { echo -e "\e[1;31m [ERR!] Input file missed, Aborting. \e[0m"; exit 1;}
rm -rf $out_dir
mkdir $out_dir
echo -e "\e[1;36m[INFO] Default output path has been cleaned up. \e[0m"

(cd $out_dir && $exec_dir < $default_in > $default_out 2> $default_err)
echo -e "\e[1;36m[INFO] Process exit with return value $?. \e[0m"