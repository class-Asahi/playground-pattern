#!/bin/bash

raw_path=$(dirname $(readlink -f $0))
project_dir=${raw_path::-8}
build_dir=$project_dir/build
test_dir=$project_dir/tests
out_dir=$project_dir/log
exec_dir=$build_dir/Untitled

if !(test -f $build_dir/Untitled); then
    echo -e "\e[1;31m [ERR!] Target binary missed, Aborting. \e[0m"
    exit 1
fi 

function check_input_file() {
    if $1 -ne ""; then
        echo -e "\e[1;33m[WARN] No input file. Using default path.\e[0m"; 
        local ref=$1
        eval $ref="'$test_dir/in.txt'"
    fi    
}

case $1 in
-t);& --test);& t)
    check_input_file input_dir
    (cd $out_dir && $exec_dir < $input_dir > $out_dir/out.txt 2> $out_dir/err.txt)
    echo -e "\e[1;36m[INFO] Process returns $?. \e[0m";;
*)
    (cd $out_dir && $exec_dir)
    echo -e "\e[1;36m[INFO] Process returns $?. \e[0m"
;;
esac