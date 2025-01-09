#!/bin/bash

SOURCE_DIR=/root/logs

if [ -d $SOURCE_DIR ]
then 
    echo "$SOURCE_DIR Exists" 
else
    echo "$SOURCE_DIR does not exists"
    exit 1
fi
