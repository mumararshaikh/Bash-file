#! /usr/bin/env bash

################################################
#  This programme written to create file
#  assign request to that file
#
#  Usage:
#  mkfile /path/to/file/filename access_mode
#  default 744(-xA)
#
#  access_mode 
#  -x (Execution to all)
#  -r (read to all)
#  -w (write to all)
#  -xA (All access to author)
#
################################################

#Version 0.1

function show_help()
{
    echo "Usage:"
    echo "mkfile /path/to/file/filename access_mode"
    echo "default 744(-xA)"
    echo ""
    echo "access_mode"
    echo "-x (Execution to all)"
    echo "-r (read to all)"
    echo "-w (write to all)"
    echo "-xA (All access to author)"
    echo ""
    echo "./mkfile --help"
    echo "Print This help menu"
}

#file="path/to/file/filename"
access="-Ax"

if [ -z "$file" ]; then
    echo "Error : no filename given"
    show_help()
    
elif [ $file == "-h" ]; then
    show_help()

elif [-f $file]; then
    echo "File already exist"
    
else
    # This will create new file
    touch $file
    
    #Assign access
    if [-z "$access"]
        chmod $file 744
    elif [$access == "-x"]; then
        chmod $file 777
    elif [$access == '-r']; then
        chmod $file 444
    elif [$access == "-w"]; then
        chmod $file 555
    else
        echo "Wrong permission code"
    fi
    
    #Open file using kate editor <more coming..>
    kate $file

fi
