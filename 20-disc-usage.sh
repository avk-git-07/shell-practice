#!/bin/bash
R="\e[31m"
N="\e[0m"
disc_usage=$(df -hT | grep xfs)
disc_threshold=5

while IFS= read -r line; do
    usage=$(echo "${line}" | grep xfs | awk -F " " '{print $6}' | cut -d "%" -f1)
    partition=$(echo "${line}" | grep xfs | awk -F " " '{print $NF}')
    if [ "${usage}" -ge "${disc_threshold}" ]
    then 
        echo -e "${R}${partition} is showing ${usage}%, which is more than the threshold percentage ${disc_threshold}, please check...${N}"  
    fi 
done <<< "${disc_usage}"

