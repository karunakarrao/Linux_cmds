# to search the string in a given file

if [ $# -eq 0 ]
then
    echo " use: script.sh file1 file2 "
    exit 1
fi

read -p "search string : " STRING 


for file in $@
do 
    if grep $STRING $file
    then   
        echo "the string is availabe "
    else
        echo "not available"
    fi
done