#!/bin/bash

read -p " enter value for A: " A 
read -p " enter value for B: " B 

if [ $A -eq $B ]
then
    echo "same"
elif [ $A -gt $B ]
then
    echo " A is big "
elif [ $A -lt $B ]
then    
    echo "B is big "
elif [ $A -ne $B ] 
then
    echo " not same "
else
    echo " $A and $B "
fi
