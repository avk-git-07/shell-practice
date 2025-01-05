#!/bin/bash

USRID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m" # no color


# THIS FUNCTION WILL BE UNTOUCHED UNLESS IT IS CALLED
VALIDATE() {
    if [ $1 -ne 0 ]
    then 
        echo  "$2.. is $R failed.. $N"
        exit 1
    else 
        echo  "$2.. is $G success.. $N"
    fi
}

# IF THIS CONDITION IS TRUE THEN ONLY IT WILL BE PRINTED ELSE IT WILL BE SKIPPED
if [ $USRID -ne 0 ]
then
    echo "Please run the script with root user"
    exit 1
fi

# the usage Ex: sh 15-loops.sh git mysql postfix nginx etc. all these packages will be installed one by one
for package in $@ # $@ means for all arguments passed to it. In the above example all listed packages will come in to $@
do 
    echo $package
done 
