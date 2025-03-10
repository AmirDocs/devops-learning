#!/bin/bash 

check_file() {
    local file_path=$1
    
    if [ -e "$file_path" ]; then
        echo "The file '$file_path' exists."
        
        if [ -r "$file_path" ]; then
            echo "The file is readable."
        else
            echo "The file is not readable."
        fi
        if [ -w "$file_path" ]; then
            echo "The file is writable."
        else
            echo "The file is not writable."
        fi
        if [ -x "$file_path" ]; then
            echo "The file is executable."
        else
            echo "The file is not executable."
        fi
    else
        echo "The file '$file_path' does not exist."
    fi
}


file_path="/mnt/c/Users/Amirb/downloads/Linux Guide - Week 1.pdf"
check_file "$file_path"

chmod +x "Linux Guide - Week 1.pdf"
