
#Date :- 23-06-2020
#Infp:- Using this script you can remove the spaces in file name and replaced it with underscore char.

#!/bin/bash

for f in *

do

	new="${f//[" - &}{][)(,_" ]/_}"
	if [ "$new" != "$f" ]
	then
		if [ -e "$new" ]
		then
		echo not renaming \""$f"\" because \""$new"\"
already exists
	else
		echo moving "$f" to "$new"
	mv "$f" "$new"
	fi
fi
done

