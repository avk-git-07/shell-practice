#!/bin/bash

# index/position starts from zero and the size is 3
FRUITS=("APPLES", "GRAPES", "MANGOS")
echo "The first fruits are : ${FRUITS[0]}"
echo "The seconds fruits are : ${FRUITS[1]}"
echo "The third fruits are : ${FRUITS[2]}"
echo "All fruits are : ${FRUITS[@]}"
