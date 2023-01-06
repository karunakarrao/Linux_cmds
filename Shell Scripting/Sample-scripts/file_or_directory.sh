
# to check the files and directories in the given location 
#!/bin/bash

read -p " provide the location for lookup: " DIR 

for file in $DIR ;
do
	if [ -f $file ]; then
		echo "file : $file"
	else
		echo "dir : $file"
	fi
done

