#!/bin/bash
Folder_A=./
for file_a in ${Folder_A}/*; do  
    temp_file=`basename $file_a`  
    echo $temp_file  
done
