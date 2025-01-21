#!/bin/bash

disc_usage=$(gf -hT | grep xfs)
disc_threshold=5

while IFS= read -r line; do
    usage=$(gf -hT | grep xfs | awk -F " " '{print $6}' | cut -d "%" -f1)
    partition=$(gf -hT | grep xfs | awk -F " " '{print $NF}')
    if [ "${usage}" -ge "${disc_threshold}" ]
    then 
        echo "${partition} is showing ${usage}%, which is more than the threshold ${disc_threshold}%, please check..."  
    fi 
done <<< "${disc_usage}"

