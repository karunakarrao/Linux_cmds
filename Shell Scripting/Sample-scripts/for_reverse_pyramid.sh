#!/bin/bash

read -p " enter a value: " num

for (( i=1; i<=$num; i++))
do 
    for (( j=1; j<=$i; j++))
    do
        echo -ne $j
    done
    echo
done
