#!/bin/bash
read -p "Enter The Number:" NUM
if [[ $NUM == "" ]]; then
    echo "Enter Valid Number."
else
    if [[ $(($NUM % 2)) -eq 0 ]]; then
        echo "EVEN"
    else
        echo "ODD"
    fi
fi
