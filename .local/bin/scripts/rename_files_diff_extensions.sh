#!/bin/bash

shopt -s nullglob

# my_files='/root/temp/files'
my_files="$(pwd)"
old_name=$1
new_name=$2

for file in "${my_files}/${old_name}"*; do
    my_extension="${file##*.}"
    mv "$file" "${my_files}/${new_name}.${my_extension}"
done

# https://unix.stackexchange.com/questions/422017/how-to-rename-files-with-different-extensions
