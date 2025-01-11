#!/bin/bash

SOUR_DIR=$1
DEST_DIR=$2
NO_DAYS=${3:-15} # if user is not providing number of days to consider the logs, then the default days will be 15.

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USAGE(){
    echo -e "$R USAGE:: sh 19-backup.sh <Source> <Destination> <no. of days(optional)> $N"
}

# now check the distination directory and source directory provided or not
if [ $# -lt 2 ] && [ $# -gt 3 ]
then 
    USAGE
fi


