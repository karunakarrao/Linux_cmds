#!/bin/bash

if [ $# -eq 0 ]
then
    echo " enter a value to check"
    exit 1
fi

if [ $(($1 % 2)) -eq 0 ]
then
    echo " $1 is an even number "
else 
    echo " $1 is an odd number "
fi
