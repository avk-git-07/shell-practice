#!/bin/bash

SOURCE_DIR=$1
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
if [ $# -lt 2 ] || [ $# -gt 3 ]
then 
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R The $SOURCE_DIR folder does not exist.. please check $N"
fi

if [ ! -d $DEST_DIR ]
then
    echo -e "$R The $DEST_DIR folder does not exist.. please check $N"
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +${NO_DAYS})

while IFS= read -r file; do
    echo "Processing file: $file"
done <<< "$FILES"


if [ -n $FILES ] # TRUE if FILES are not empty, i.e., some files are there
then 
    echo "Files are found"
    echo "$FILES"
else 
    echo "No files found older than $NO_DAYS"
fi
