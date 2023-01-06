#!/bin/bash

if [ $# -eq 0 ]
then
    echo " provide 2 aruguments "
    exit 1
fi

echo ' value for $2: ' $2
echo ' value for $*: ' $*
echo ' value for $@: ' $@
echo ' value for $#: ' $#
echo ' value for $1: ' $1





