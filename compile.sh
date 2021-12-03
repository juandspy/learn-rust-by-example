#!/bin/bash

# Exits the program if the status code is not 0.
# $1 = the status code
check_exit() {
    if [ $1 -ne 0 ] 
    then 
        echo "Error running compile.sh"
        exit $1
    fi
}

# Compiles, runs and delete the generated binary given a `.rs` file.
# $1 - the name of the `.rs` file.
main() {
    fullfile="$1"
    filename_no_ext=$(basename "$fullfile" .rs)
    extension="${filename##*.}"

    rustc $fullfile
    check_exit $?  
    ./$filename_no_ext
    check_exit $?  
    rm $filename_no_ext
    check_exit $?  
}

main $1