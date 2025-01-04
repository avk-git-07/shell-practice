#!/bin/bash

# dnf install git -y
USERID=$(id -u)
echo "User id is : $USERID"

if [ $USERID -ne 0 ]
then
    echo "Please run the script with root user"
    exit 1
fi


dnf list installed gittt
if [ $? -ne 0 ]
then
    echo "The git is not yet installed, let us install it."
    dnf install gittt -y
    if [ $? -ne 0 ]
    then
        echo "The git installation is not success. Please check it."
        exit 1
    else
        echo "The git installation is success"
    fi
else
    echo "The git is installed, nothing to do..."
fi
