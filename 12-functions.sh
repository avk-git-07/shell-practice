#!/bin/bash

# dnf install git -y
USERID=$(id -u)
# echo "User id is : $USERID"

VALIDATE() {
    if [ $1 -ne 0 ]
    then 
        echo "$3.. is failed.."
        exit 1
    else 
        echo "$3.. is success.."
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run the script with root user"
    exit 1
fi


dnf list installed git

VALIDATE $? "Listing git"

# if [ $? -ne 0 ]
# then
#     echo "The git is not yet installed, let us install it."
#     dnf install git -y
#     if [ $? -ne 0 ]
#     then
#         echo "The git installation is not success. Please check it."
#         exit 1
#     else
#         echo "The git installation is success"
#     fi
# else
#     echo "The git is installed, nothing to do..."
# fi

# dnf list installed mysql
# if [ $? -ne 0 ]
# then 
#     echo "Mysql installation is not done, let us install it.."
#     dnf install mysql -y
#     if [ $? -ne 0 ]
#     then 
#         echo "Mysql installation is failure.., check it"
#         exit 1
#     else 
#         echo "Mysql installation is successful."
#     fi
# else 
#     echo "Mysql is already installed, nothing to do.."
# fi


