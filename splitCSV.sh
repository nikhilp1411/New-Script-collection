#!/bin/bash

#Desc:- This script useful to spilt one csv to multiples

#Author:- Nikhil

#Date:- 17Nov20

FILE=$1

split -l 999 $FILE xyz

n=1

for f in xyz*

do 

	cat $f > File_${n}.csv
	rm $f
	((n++))
done
