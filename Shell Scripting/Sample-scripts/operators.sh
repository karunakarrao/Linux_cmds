#!/bin/bash

read -p "enter value for A: " A
read -p "enter value for B: " B 

if [[ -n $A && -n $B ]]         # must use [[ ]] for multipule conditions
then
    if [  $A != $B ]
    then
        echo " values are different "
    elif [ $A = $B ]
    then
        echo " values are same "
    else
        echo "values "
    fi
elif [ -z $B || -z $A ]
then
    echo "A || B  is null"
else
    echo " do nothing"
fi

