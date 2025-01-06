#!/bin/bash

# first $ is a command substitution, it allows to run a command and capture its output into a variable.
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)   
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USRID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m" # no color

#CHECK_ROOT(){
if [ $USRID -ne 0 ]
then
    echo "Please run the script with root user" | tee -a  &>> LOG_FILE
    exit 1
fi
#}


# THIS FUNCTION WILL BE UNTOUCHED UNLESS IT IS CALLED
VALIDATE() {
    if [ $1 -ne 0 ]
    then 
        echo -e "$2.. is $R failed.. $N" | tee -a  &>> $LOG_FILE
        exit 1
    else 
        echo -e "$2.. is $G success.. $N" | tee -a  &>> $LOG_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE:: sudo sh 16-redirectors.sh package1 package2 ... etc, like this we have to run the script !!! $N"
    exit 1
}

# IF THIS CONDITION IS TRUE THEN ONLY IT WILL BE PRINTED ELSE IT WILL BE SKIPPED
# CHECK_ROOT
#   if [ $USRID -ne 0 ]
#     then
#         echo "Please run the script with root user" &>> $LOG_FILE
#         exit 1
#     fi
echo "Script started executing at : $TIMESTAMP" | tee -a  &>> $LOG_FILE


if [ $# -eq 0 ]
then 
    USAGE
fi

for package in $@ # $@ means for all arguments passed to it. In the above example all listed packages will come in to $@
do 
    dnf list installed $package | tee -a  &>> $LOG_FILE
    if [ $? -ne 0 ]
    then 
        echo "The $package is not installed, we are going to install it.." | tee -a  &>> $LOG_FILE
        dnf install $package -y | tee -a  &>> $LOG_FILE
        VALIDATE $? "installation of $package" | tee -a  &>> $LOG_FILE
    else
        echo -e "$Y The $package is already installed, nothing to do ... $N" | tee -a &>> $LOG_FILE
    fi
done 
