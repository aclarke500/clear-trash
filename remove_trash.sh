#!/bin/bash

# hardcode list for simplicity
# declare -a dir_names=

trash_dir='.should_delete'

# create directory to hold all this shit

# test to see if directory exists
if !(ls "$trash_dir"); then # ls failed -> we need to mkdir
    mkdir "$trash_dir"
fi


for file in ./*; do
    
    is_valid_file=0
    for d in "Main" "Code"; do
        file_name='./'$d
        # echo $file_name
        if [[ "$file_name" == "$file" ]]; then
            is_valid_file=1
            elif [[ "$file_name" == $0 ]]; then
            is_valid_file=1
        fi
    done
    echo "$file"
    echo $is_valid_file
    
    if [[ "$is_valid_file" == "0" ]]; then
        temp=${file:2}
        echo $temp
        
        if [ -f ""$trash_dir"'/'$temp" ]; then # can't move -> duplicate
            counter=0
            success=0
            
            while [ "$success" == "0" ]; do
                ((counter++))
                mv "$file" "$trash_dir"'/'$temp$counter
            done
            
        fi
        
    fi
done;
