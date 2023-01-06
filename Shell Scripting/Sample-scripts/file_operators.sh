#!/bin/bash

read -p "file full path : " FILE 

if [ -d $FILE ]
then    
    echo "file exists, but its direcoty"
elif [ -e $FILE ]
then    
    echo "its file, `cat $FILE`"
else
    echo "do nothing"
fi

