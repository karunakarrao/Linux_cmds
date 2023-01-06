#!/bin/bash

read -p " enter a number : " num

for (( i=$num; i>=0; i-- ))
do
    for (( j=1; j<=$i; j++ ))
    do
        echo -ne $j
    done
    echo 
done
