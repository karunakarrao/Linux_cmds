 ===================================================================================================================
				:::Scripting Basics:::
			https://tldp.org/LDP/abs/html/index.html		
===================================================================================================================

$ bash -x script-name.sh 	--> to debug the script
set -x 				--> inside the script is used to debug the script
-----------
#!/bin/bash
set -x 		# --> enable Debug inside script
-----------

break, continue, do, done 	--> only meaningful in a `for` `while` and `until` loops

$* 		--> arguments are comes in a line
$@ 		--> arguments comes in newline each time

String	 	--> string operator used   `=`, `==`, `!=`
numbers: 	--> operator used to check condition `[ -eq, -ne, -gt, -lt, -le, -ge]`

tee 		--> Imagine you want to store logs of an application into a file and at the same time print it on the console.
	
 	$ echo "Hello, world!" | tee /tmp/hello.txt
	$ echo "Hello, world!" | tee >(tr '[:upper:]' '[:lower:]' > /tmp/hello.txt)

	[ -f FILE ]	--> check file exists or not
	[ -e FILE ]	--> if file exists
	[ -d FILE ]	--> if file exists and is a directory
	[ -s FILE ]	--> If file exists and has size greater than 0
	[ -x FILE ]	--> If the file is executable
	[ -w FILE ]	--> If the file is writeable

------------------------------------------------------------------------------------------------------------------
Q. How to change the color of terminal promt and disply the path were you are now ?
------------------------------------------------------------------------------------------------------------------
A. goto `.bashrc` and \u is 'user' \h is 'hostname' \w is working directory \$ is symbol. 

	PS1="\u@\h:\$(pwd)\$ "
	PS1="\[\e[32m\]\u@\h:\w \[\e[36m\]\$(pwd)\[\e[0m\]\$ "
	PS1="\[\e[37m\]\u@\[\e[31m\]\h: \[\e[32m\]\$(pwd)\[\e[0m\]\$ "
	
	Black: 	\[\e[30m\]
	Red: 	\[\e[31m\]
	Green: 	\[\e[32m\]
	Yellow: \[\e[33m\]
	Blue: 	\[\e[34m\]
	Magenta: \[\e[35m\]
	Cyan: 	\[\e[36m\]
	White: 	\[\e[37m\]
 
------------------------------------------------------------------------------------------------------------------
env:
------------------------------------------------------------------------------------------------------------------
to export environment variables for specific to directory, install `direnv` package extention. this will allow you to export variables for that specific directory. 
https://shivamarora.medium.com/a-guide-to-manage-your-environment-variables-in-a-better-way-using-direnv-2c1cd475c8e


 	$ sudo apt-get install direnv	--> install packages
 	$ eval "$(direnv hook bash)"	--> add this line in ~/.bashrc file
  create your project directory `project1`, inside create `.envrc` file and update the file with your directory specific variables.
  	
  	$ touch .envrc			--> directory specific variables 
   	$ source .bashrc		--> source the .bashrc file 
	$ cd project1			--> switch to project
 	$ direnv allow			--> first time Linux will reject the changes. but you can allow by running this command. 
 
--------------------------------------------------------------------------------------------------------------------
echo:
--------------------------------------------------------------------------------------------------------------------
to print data on the stdout, string or numberic data. 
. A backslash `\` is used to escape special character meaning.
. Encapsulating the variable name with `${}` is used to avoid ambiguity
. for variables use `${ }`, for commands use `$( )` to execute.
. we can print the date using the date command and `$(/bin/date +%Y-%m-%d)`

exmple:
-------------------
```
#!/bin/bash
echo "my age is 32"
echo 'my name is raj'
echo "The price of an Apple today is: \$HK $PRICE_PER_APPLE"
echo "filename_$(/bin/date +%Y-%m-%d)" 
echo ${#VAR1} 	--> to count number of VAR1 variable charecters
echo ${VAR1}string
```
-------------------------------------------------------------------------------------------------------------------
Date:
-------------------------------------------------------------------------------------------------------------------
date command is used in many places, there are some useful commands. for more use `man date`.

syntax: $ date -d "<$anystring>" +%y/%Y/%b/%B/%a/%A

	$ date -d "$year" +%Y		# o/p : 2023
	$ date -d "$day" +%B		# o/p : January
	$ date -d "$date1" +%A		# o/p : Sunday
	$ date "+%D"          		# Output: 10/11/17
	$ date "+%D %T"         	# Output:  10/11/17 16:13:27
	$ date "+%Y-%m-%d"      	# Output:  2017-10-11
	$ date "+%Y/%m/%d"      	# Output:  2017/10/11
	$ date "+%A %B %d %T %y"	# Output: Thursday October 07:54:29 12 17

To set your local timezone for your terminal use `timedatectl` as below.

	$ timedatectl list-timezones
 	$ timedatectl set-timezone Asia/Kolkata			--> This will change your timezone to your native time

-------------------------------------------------------------------------------------------------------------------
String:
-------------------------------------------------------------------------------------------------------------------
string operations like count, and other activities are 

To count the length of the string including spaces.
---------------------------------------------------
```
#!/bin/bash
STRING="this is a string"
echo ${#STRING} 
```
To prune string with position and length 
--------------------------------------------------
```
#!/bin/bash
STRING="this is a string"
POS=1
LEN=3
echo ${STRING:$POS:$LEN}	# ${STRING:1:4}
```
String replacement 
--------------------------------------------------
```
#!/bin/bash
STRING="to be or not to be"
echo ${STRING[@]/be/eat} 	# Replace first occurrence
echo ${STRING[@]//be/eat}  	# Replace all occurrences of substring
echo ${STRING[@]// not/}	# Delete all occurrences of substring
```
--------------------------------------------------------------------------------------------------------------------
cut: command operations in shell script
--------------------------------------------------------------------------------------------------------------------
for cutting the string to get the desired output.

	$ cut -b 1-4 /etc/passwd			--> -b byte string from 1st postion to 4th position
	$ cut -c -4 /etc/passwd				--> -c character from 1 to 4
	$ cut -d : -f 1 /etc/passwd 			--> -d delimitor ":", -f fields First
	$ cut -d " " -f 1 state.txt			--> " " space as delimitor
 
	$ cut --complement -d : -f 1 /etc/passwd			--> it will remove 1st delimitor field and print rest.
	$ cut -d ":" -f 1,2 /etc/passwd --output-delimiter='%'		--> replace " " with % 
	$ cat /etc/passwd |cut -d : -f 1 | sort 			--> sorted 
	$ cat /etc/passwd |cut -d : -f 1 | sort  -r 			--> reverse order in sorting

--------------------------------------------------------------------------------------------------------------------
sed: command operations in shell script:
--------------------------------------------------------------------------------------------------------------------
	-e :	 	$ sed -e 's/class/room/g;s/name/age/g' test		--> -e for mutipule sed commands 
	-i :	 	$ sed -i 's/Centos/Linux/g' test			--> -i updating the same file
	-i.back	: 	$ sed -i.backup 's/Centos/Linux/g' test			--> to backup existing file and do changes in original file
	-f : 

	$ echo "my class is a good class, in my class every" |sed 's/class/room/' --> replaces first argument in a line
 
	$ sed 's/class/room/2' class.txt 	--> replaces first 2 occurences in a line
	$ sed 's/class/room/3' class.txt 	--> replaces first 3 occurences in a line
	$ sed 's/class/room/g' class.txt 	--> replaces all strings matching "Class" with "room"
	$ sed '3s/class/room/' class.txt 	--> replaces string in a specific line
	$ sed '1,3s/class/room/' class.txt	--> replaces from line 1 to 3 only
	
	$ sed '1d' class.txt 		--> delete the 1st line
	$ sed '2d;4d;6d' class.txt	--> delete lines 2,4 and 6
	$ sed '/apple/d' fruits.txt	--> delete lines with string apple
	$ sed '/apple/!d' fruits.txt 	--> delete lines except string apple | invert delete
	$ sed '/^$/d' fruits.txt 	--> delete empty lines in a file
	
	$ sed -i 's/apple/banana/g' fruits.txt 			--> update the changes in the original file
	$ sed -i.backup 's/apple/bananna/g' fruits.txt 		--> update the original file and take backup of original file.
	
	$ sed -e 's/class/room/g;s/name/age/g' class.txt  				--> execute mutiple sed commands.
	$ sed -i.bakup_`date +%Y-%m-%d` -e 's/Centos/Linux/g;s/sandbox/mybox/g' test	--> mutiple sed commands with backup file

--------------------------------------------------------------------------------------------------------------------
awk: command operations in shell script
--------------------------------------------------------------------------------------------------------------------
	NR --> NR command keeps a current count of the number of input records.
	NF --> NF command keeps a count of the number of fields within the current input record. 
	$NF --> prints value on that position 
 	$0 --> entire line 
	$1 --> 1st colum
 	$2 --> 2nd colum


	$ awk '{print}' test.txt  	--> it will work like cat command
	$ awk '{print $1}' test.txt 	--> prints 1st coloum
	$ awk '{print $2}' test.txt 	--> prints 2nd coloum
	
	$ awk '!/Linux/ {print}' test.txt	--> prints lines doesn't contain word "Linux" 
	$ awk '/Linux/ {print}' test.txt	--> lines contain word "Linux"
	
	$ awk '{print NR, $0}' test.txt   	--> prints lines with numbers
	$ awk '{print $1, $NF}' test.txt  	--> prints 1st coloum and $NF value which is last coloum
 
	$ awk 'NR==3, NR==6 {print NR,$0}' employee.txt 	--> print lines from 3 to 6
	$ awk '{print NR "- " $1 }' geeksforgeeks.txt 		--> number lines with 

--------------------------------------------------------------------------------------------------------------------
array: 
--------------------------------------------------------------------------------------------------------------------
an array is a single dimention data. this array will run only `bash/korn` shell so, while writing the code be aware of it. 

	fruits=(mango banana orange grapes apple) 		--> correct
	fruits=("mango" "banana" "orange" "grapes" 1000) 	--> correct
	fruits=(mango, banana, orange, apple) 			--> incorrect ( , aslo takes as charecter)

	${fruits[1]} 		--> array eliment position starts from (0 1 2 3) so...
	${fruits[@]} 		--> "@" "*" all eliments in an array
	${#fruits[@]} 		--> "#" will count of eliments in an array

-----------------------------
```
#!/bin/bash
fruits=(mango orange apple "sapota" santra 20 500)
for fruit in ${fruits[@]}
do 
	echo "fruit name is $fruit"
done
echo "fruits count in array is"${#fruits[@]}	# it counts the number of eliments in an array: ${#fruits[@]} of array 
echo "All fruits:" ${fruits[@]}			# it will print eliments in the array: ${fruits[@]}
```
--------------------------------------------------------------------------------------------------------------------
quotes:
--------------------------------------------------------------------------------------------------------------------
we will be using differnt quotes in shell scripting like `( " ", '', ` ` )`. each quote has its own perpose. so while using this we should be careful.

	"" 	--> will read the values of variables defined in the script and print the output of that variable
	'' 	--> will consider data between ' ' as a string so, it will not print the values of variable.
	`` 	--> is to execute a command we use this ` ` quotes. it will consider as a single command.
	$() 	--> will execute the command inside the ( ) braces. same as ``. 

---------------------------
quotes.sh
---------------------------
```
#!/bin/bash
NAME="rajesh"
YEAR=2022
echo "$NAME" 
echo '$YEAR'
echo `date`
```
--------------------------------------------------------------------------------------------------------------------
Variable:
--------------------------------------------------------------------------------------------------------------------
variables defined in the shell script are case sensitive, and it will only allow `  _  ` while define the variable.

1. case sensitive 
2. only underscore ` _ ` is allowed, ` - ` not allowed 
```
MISSION_NAME != mission_name	--> case sensitive
"mission_name"			-->  is correct
"mission-name" 			--> is incorrect
```
3. no space while defining the variable
```
A=10 		--> correct
B=20 		--> correct
Name="raj" 	--> correct 

Name = "kumar" 	--> incorrect
A = 10 		--> incorrect
B = 20 		--> incorrect
```
--------------------------------------------------------------------------------------------------------------------
read
--------------------------------------------------------------------------------------------------------------------
to pass any user inputs to the script we need to use the keyword `read` keyword 

 	echo 	--> is to print data 
	read 	--> is to input a variable by enduser.

read.sh
-------------------------------------------
```
#!/bin/bash
read -p " provide name: " NAME
read -p " provide age: " AGE
echo $NAME
echo $AGE
```
--------------------------------------------------------------------------------------------------------------------
Special Varibales:
--------------------------------------------------------------------------------------------------------------------
below are the special variables used to store the values. each variable is defined to store the specific value. 

----------------------
$* 
----------------------
to store the `arguments passed` to the script ($1, $2, $3,...). Output will come in new line.
```
#!/bin/bash
echo "Using \$*:"
for arg in "$*"; do
    echo "$arg"
done
```
---------------------
$@ 
----------------------
to store the `arguments passed` to the script ($1, $2, $3,...). Outut will come in single line.
```
#!/bin/bash
echo "Using \$*:"
for arg in "$@"; do
    echo "$arg"
done
```
----------------------
$#
----------------------
to store the `input argument count` passed to the script
```
#!/bin/bash
echo "using \$# and \$*"
for arg in $*
do 
  echo "$arg"
done
echo " input argument count $#"
```
Note: if you specify " * " as script argument, that means it will take the file in that directory as arguments.

--------------------------
$? 
--------------------------
to store the `exit-code`/value of last command exicuted use `$?`

	0: Success 			--> This code indicates that the previous command executed successfully without any errors.
	1: General error 		--> It is a generic error code that indicates something went wrong during the execution of the previous command.
	126: Command not executable. 	--> This code suggests that the command was not found or is not executable.
```
#!/bin/bash
ping -w 3 192.168.1.10  
if [ $? -eq 0 ]
then
  echo "server ping is successful"
else
  echo " server failed to ping EXIT-CODE: $?"
fi
```
--------------------------
$$ 
--------------------------
to store the `PID value` of that script
```
#!/bin/bash
echo "The PID of the current shell is: $$"
touch "testfile_$$"
```
--------------------------
$!  
--------------------------
to store the `PID value` of the last background job
```
#!/bin/bash
sleep 10 &		# we use "&" to run in background.
background_pid=$!
echo "$background_pid"
```
--------------------------
$0 	--> to store script name
$1 	--> to store first argument as an input
$2 	--> to store second  argument
$3 	--> to store third argument
-------------------------------

----------------------------
Special-variable.sh
----------------------------
```
#!/bin/bash
# this is to check how the special variables are used 

echo "Value stored in special variable"'$*': $*
echo "Value stored in special variable"'$#': $#
echo "Value stored in special variable"'$?': $?
echo "Value stored in special variable"'$0': $0
echo "Value stored in special variable"'$1': $1
echo "Value stored in special variable"'$2': $2
echo "Value stored in special variable"'$$': $$
echo "Value stored in special variable"'$!': $!
echo "Value stored in special variable"'$@': $@
```
---------------------------
```
echo -e "Line1\nLine2" 	--> if you add space in between them you are adding a space charecter. 
echo -n "Hello-World" 	--> writes in same line
```
----------------------------
test.sh
----------------------------
```
if [ "$#" -eq 0 ] ; 
then
	echo -e "No argument."
	echo -e "Write a number between 1 and 12."

	exit 1		# Job failed and exited from script.
fi
```
Note: You use exit 1 to indicate that an error occurred during the execution of your script. In shell scripting, exit 1 is a command used to exit a script with an error status. 

--------------------------------------------------------------------------------------------------------------------
Arithmetic:
--------------------------------------------------------------------------------------------------------------------
1. for arthemetic operation we user "expr" command. 
2. we must use space between each variable +, -, *, /,^
3. we can use $(expr   ) or $((   ))
--------------------
```
A=10
B=20 
echo `expr $A + $B`
echo $(expr $B - $A)
echo $(expr $A \* $B)
echo `expr $A / $B`
```
-----------------------
3. if we write arthemetic operators between "((  ))", we can write freely
-----------------------
```
A=10
B=20
echo $((A+B)) | echo $((A - B))| echo $(( A * B))
```
-----------------------
4. for float caliculation need to use package tool "bc"
-----------------------
```
echo $((22/7)) 		--> o/p: 3 
echo 22/7 |bc -l 	--> o/p: 3.14285714285714285714
```
--------------------------------------------------------------------------------------------------------------------
Conditional Logic:
--------------------------------------------------------------------------------------------------------------------
Conditional operators:
----------------------------------------
1. conditons are written in `[ ] or [[ ]]`
2. list of operators 

String: string operator used for checking `[ =, != ]`

example:
---------
	[ "abc" = "abc" ] 
	[ "abc" != "abc" ]
	
--------------------------------------------------------------------------------------------------------------------
Relational Operators:
--------------------------------------------------------------------------------------------------------------------
numbers: operator used to check condition `[ -eq, -ne, -gt, -lt, -le, -ge]`

example:
-----------
	[ 5 -eq 5 ]
	[ 5 -ne 5 ]
	[ 6 -gt 5 ]
	[ 5 -lt 6 ]

String Comparisons
+------------------+-----------------------------------------------+
|   Conditions     |                    Description                |
+------------------+-----------------------------------------------+
| Str1 = Str2      | True if the strings are equal                 |                            
| Str1 != Str2     | True if the strings are not equal             |
| -n Str1          | True if the string is not null                | 
| -z Str1          | True if the string is null                    |                             
+------------------+-----------------------------------------------+
Numeric Comparisons
+------------------+-----------------------------------------------+
|   Conditions     |                    Description                |
+------------------+-----------------------------------------------+
| expr1 -eq expr2  | True if the expressions are equal             |
| expr1 -ne expr2  | True if the expressions are not equal         |
| expr1 -gt expr2  | True if expr1 is greater than expr2           |
| expr1 -ge expr2  | True if expr1 is greater than equal to expr2  |
| expr1 -lt expr2  | True if expr1 is less than expr2              | 
| expr1 -le expr2  | True if expr1 is less than or equal to expr2  |
| !expr1           | Negates the result of the expression          |            
+------------------+-----------------------------------------------+

--------------------------------------------------------------------------------------------------------------------
Multipule conditions:
--------------------------------------------------------------------------------------------------------------------
if you want to check mutiple condictions we can use 
"AND" -> -a -> "&&" operator
"OR" ->  -o -> "||" operator
"NOT" -> -n -> "!"

cond1 && cond2 && cond3
(or)
cond1 -a cond2 -a cond3 
(or)
cond1 || cond2 || cond3

example:
-------------------
```
if [[ $VAR_A[0] -eq 1 && ($VAR_B = "bee" || $VAR_T = "tee") ]] 
then
    command...
fi
```
--------------------------------------------------------------------------------------------------------------------
if:
--------------------------------------------------------------------------------------------------------------------
if is a conditional statement, to check the conditon is met then the logic will exicute esle not. we must follow few things writing the if statements. below are the rules.    

1. conditions are writen in [ ]
2. must use space between conditions and braces
	`if [ $A -gt $B ]`
3. if we have multiple conditions we can user `[[ ]]` and 
	`if [[ $A -gt $B && $A -lt $C ]] `	--> and condition
	`if [[ $A -gt $B || $A -lt $C ]] `	--> or condition 
4. linus file operatios
	`[ -e FILE ]`	--> if file exists
	`[ -d FILE ]`	--> if file exists and is a directory
	`[ -s FILE ]`	--> If file exists and has size greater than 0
	`[ -x FILE ]`	--> If the file is executable
	`[ -w FILE ]`	--> If the file is writeable

------------------------------------------
exmaple:1
------------------------------------------
```
if [ $rocket_status = "failed" ]
then
	echo " Rocket debug is exicuting"
elif [ $rocket_status = "failed" ]
then
	echo " Rocket launch successful"
else 
	echo "the status is not failed or success"
fi
```
--------------------------------------------
example:2
--------------------------------------------
```
if [ -e filename ]
then
	echo "file exists"
else
	echo "file not exists"
fi
```
--------------------------------------------
example:3
--------------------------------------------
```
read -p "Pinging host IP-Address:" IP
ping -w  3 $IP
if [ $? -eq 0]; then
echo "ping is success"
fi
```
--------------------------------------------------------------------------------------------------------------------
for: 
--------------------------------------------------------------------------------------------------------------------
for loop will run until the condition is True, otherwise it will run infinite times.
	
example:1
----------------------------------------
```
for mission in $(cat mission-names.txt)
do 
	echo " Mission name: $mission"
done
```
---------------------------------------
example:2
--------------------------------------
```
for mission in 1 2 3 4 5 6
do
	echo " mission-$mission"
done
```
---------------------------------------
example:3
-------------------------------------
```
for mission in {0..100}
do	
	echo "$mission"
done
```
-------------------------------------
example:4 we can write like below also
-----------------------------------------
```
for (( mission = 0 ; mission <= 100; mission++ ))
do
	echo "$mission"
done
```
-------------------------------------
example:5 
-----------------------------
```
#!/bin/bash
list=(1 2 3 4 5)
for i in ${list[@]}
do 
	echo $i
done
```
----------------------------------------
example:5 : real time
----------------------------------------
```
for package in $(cat install-packages.txt)
do
	sudo apt-get –y install $package
done
```
------------------------------
example:6 : real time
-----------------------------
```
for server in $(cat servers.txt)
do
	ssh $server "uptime"
done
```
------------------------------
example:7 : real time
-----------------------------
```
for file in $(ls)
do
	echo Line count of $file is $(cat $file | wc -l)
done
```

--------------------------------------------------------------------------------------------------------------------
while:
--------------------------------------------------------------------------------------------------------------------
this loop will end only when the condition is satisfied else it will be an infinity loop. The while true construct is commonly used in shell scripting to create an infinite loop that continues executing until explicitly terminated. 

example:
------------------
```
while [ condition ]
do 
	<< logic ..>>
done
```
example:
-------------------
```
#!/bin/bash
COUNT=4
while [ $COUNT -gt 0 ]; do
  echo "Value of count is: $COUNT"
  COUNT=$(($COUNT - 1))
done
```
-------------------------
```
#!/bin/bash
while true
do
	echo "1. Shutdown"
	echo "2. Restart"
	echo "3. Exit Menu"

	read –p "Enter your choice: " choice

	if [ $choice -eq 1 ]
	then
		shutdown now
	elif [ $choice -eq 2 ]
	then
		shutdown –r now
	elif [ $choice -eq 3 ]
	then
		break
	else
		continue
	fi
done
```
-----------------------------------------------------

--------------------------------------------------------------------------------------------------------------------
case:
--------------------------------------------------------------------------------------------------------------------
we can use case statement in above script. The case statement in shell scripting is useful when you want to perform different actions based on the value of a variable. It provides a way to evaluate multiple patterns and execute corresponding code blocks.

example:1
-----------------------------------------------
```
while true
do 
	echo "1. Shutdown"
	echo "2. Restart"
	echo "3. Exit Menu"

	read -p "Enter your choice: " choice

	case $choice in
		1) shutdown now ;;
		2) shutdown -r now ;;
		3) break ;;
		*) continue ;;
	esac
done
```
--------------------------------------------

exit code: can be find using "$?"
-----------------------------------
after exicuting every command we will get one exit code value which is used to check the staus of the command

example:
------------------------
	$ ls ; echo $?; 	--> o/p: 0 | this will give the exit code for ls command

example:1
--------------------
	$ lsss; echo $? 	--> o/p: >0 | failed 

------------------------------------------------------------------------------------------------------------
"break" and "continue" statements:
------------------------------------------------------------------------------------------------------------
`break` and `continue` can be used to control the loop execution of `for`|`while`|`until` constructs. continue is used to skip the rest of a particular loop iteration, whereas break is used to skip the entire rest of loop. A few examples:

example:
---------------------
```
# Prints out 0,1,2,3,4

COUNT=0
while [ $COUNT -ge 0 ]; do
  echo "Value of COUNT is: $COUNT"
  COUNT=$((COUNT+1))
  if [ $COUNT -ge 5 ] ; then
    break
  fi
done

# Prints out only odd numbers - 1,3,5,7,9
COUNT=0
while [ $COUNT -lt 10 ]; do
  COUNT=$((COUNT+1))
  # Check if COUNT is even
  if [ $(($COUNT % 2)) = 0 ] ; then
    continue
  fi
  echo $COUNT
done
```
--------------------------------------------------------------------------------------------------------------------
functions:
--------------------------------------------------------------------------------------------------------------------
how define a function to remove the duplication of code

	1. function is defined as (ex: function function-name(){ << logic >> })
	2. we can pass arguments in to function as $1 $2 and so on
	3. we can that funcation using funcation name followed by arguments (ex: funcation-name $1 $2 )

syntax:
------------------
function <function-name>(){
...
...
...
}
---------------------------
```
#!/bin/bash

# Function definition
greet() {
    echo "Hello, $1!"
    echo "How are you doing?"
}
# calling greet function 
greet "$1"
```
---------------------------
example:1 
-------------------------
```
function dir_check() {
    for name in $1
    do 
	if [ -d $2/$name ]
	then
		continue
	else
		echo "directory $name not available"
		mkdir -p $2/$name
		if [ $? -eq 0 ]
		then
			echo "Directory Created"
		else
		echo "Failed to Create Directory"
		fi
	 fi
    done
}

dir_check $tm_dir_list $ndrx_home
dir_check $qdata_dir_list $ndrx_home
```
-----------------------  

--------------------------------------------------------------------------------------------------------------------
set: is a positional parameters
--------------------------------------------------------------------------------------------------------------------

#!/bin/bash
set `date`
echo "$1"
echo "$2"
echo $3

--------------------------------------------------------------------------------------------------------------------
until:
--------------------------------------------------------------------------------------------------------------------
until loop is used to check till the condition is true. that means it will keep checking the givn condition is true. 
The until statement in shell scripting is used to create a loop that continues executing a block of code until a specific condition becomes true. It is the opposite of the while loop, which executes the code block as long as the condition is true.

```
#!/bin/bash
echo -e " Please enter the 'IP' to check the 'Ping' status : "
read -r IP
until ping -c 3 $IP
do 
	echo "$IP is not reachable"
	sleep 5
done
echo "$IP is now reachable"
```
------------------------------
```
#!/bin/bash

counter=1

until [ $counter -gt 5 ]
do
    echo "Counter value: $counter"
    counter=$((counter + 1))
done
```
--------------------------------------------------------------------------------------------------------------------
getopts
--------------------------------------------------------------------------------------------------------------------

CPU Alerts
--------------------------------------------------------------------------------------------------------------------

#!/bin/bash
HOSTNAME=$(hostname)
CRITIAL=95
WARNING=90


%h --> hours
%d --> date
%y --> year

sh -x script.sh 	--> for debug
shellcheck.net 		--> to check and debug the issues

It often comes the situations that you want to catch a special signal/interruption/user input in your script to prevent the unpredictables.

---------------------------------------------------------------------------------------------------------------------
Trap is your command to try:
---------------------------------------------------------------------------------------------------------------------
This is a useful to control/restrict the user intervention in the program while running. similer like Ctrl+c (or) Ctrl+z and meny more. to avoid this type of intervention from the user side, we can use this function to avoid humun intervention in program. 

kill -l --> to check for available trap signals

syntax: trap <arg/function> <signal>

trap "echo welcome" SIGINT SIGTERM 	# we can mention signal name 
(or)
trap "rm -f folder; exit" 2 15		# we can mentiron signal number as per `kill -l`

