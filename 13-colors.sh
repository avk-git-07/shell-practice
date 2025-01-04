#!/bin/bash

# dnf install git -y
USERID=$(id -u)
# echo "User id is : $USERID"

VALIDATE() {
    if [ $1 -ne 0 ]
    then 
        echo  "$2.. is failed.."
        exit 1
    else 
        echo  "$2.. is success.."
    fi
}

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
    VALIDATE $? "Git Installation"
else
    echo -e "\e[32m The git is installed, nothing to do..."
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "Mysql installation is not done, let us install it.."
    dnf install mysql -y
    VALIDATE $? "Mysql Installation"
else 
    echo -e "\e[32m Mysql is already installed, nothing to do.."
fi


