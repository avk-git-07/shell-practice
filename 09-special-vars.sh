#!/bin/bash

echo "All the variables passed to the script: $@" # we can use $* also to get all.
echo "Number of variables passed : $#"
echo "Script Name: $0"
echo "Current Working Directory: $PWD"
echo "Home Directory of current user: $HOME"
echo "PID(Process Instance ID) of the script executing now: $$"
sleep 100 &
echo "PID of last background command: $!" 


