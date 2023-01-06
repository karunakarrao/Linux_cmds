#!/bin/bash

read -p "enter A:" A
read -p "enter B:" B 

echo $( expr $A + $B )
echo `expr $A + $B`
echo $(($A+$B))