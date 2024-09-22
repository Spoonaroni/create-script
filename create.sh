#! /bin/bash

echo "0(Exercises) or 1(Projects)"
read n

echo "Which chapter?"
read chap

echo "Enter number of directories:"
read num

ones=1
tens=0
c=1
if [ $n -eq 0 ]
then
	if test -e "exercises"
	then
		echo "exercises/ exists"
		cd exercises
	else
		echo "exercises/ does not exist"
		mkdir exercises
		cd exercises
	fi
else
	if test -e "projects"
	then
		echo "projects/ exists"
		cd projects
	else
		echo "projects/ does not exist"
		mkdir projects
		cd projects
	fi
fi
while [ "$tens$ones" -le "$num" ];
do
	if test -e "$tens$ones"; 
	then
		echo "$tens$ones/ exists"
		cd "$tens$ones"
	else
		echo "$tens$ones/ does not exist"
		mkdir "$tens$ones"
		cd "$tens$ones"
	fi

	if test -e "README.md";
	then
		echo "$tens$ones/README.md exists"
		cd ../
	else
		echo "$tens$ones/README.md does not exist"
		if [ $n -eq 0 ];
		then
			echo "## Exercise $chap.$tens$ones



## Solution" >> README.md
			cd ../
		else
			echo "## Project $chap.$tens$ones



## Solution" >> README.md
			echo "#include <stdio.h>

int main(void)
{


	return 0;
}" >> $c.c
			cd ../
		fi
	fi
	
	c=$((c+1))
	ones=$((ones+1))
	if [ $ones -eq 10 ]; 
	then
		ones=0
		tens=$((tens+1))
	fi
done
echo "done :)"
