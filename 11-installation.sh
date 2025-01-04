#!/bin/bash

# dnf install git -y
USERID=$(id -u)
echo "User id is : $USERID"

if [ $USERID -ne 0 ]
then
    echo "Please run the script with root user"
    exit 1
fi


dnf list installed git
if [ $? -ne 0 ]
then
    echo "The git is not yet installed, let us install it."
    dnf install git -y
else
    echo "The git is installed, nothing to do..."
    