#!/bin/bash
#Goal: Anchor comand. Makes jumping around files easy!

if [ -z "$1" ]; then
	echo "Usage: a <anchor name> | a clear | a list";
elif [ "$1" == 'clear' ]; then
	echo "Anchors cleared.";
	rm "/home/lweber/programing/bash/anchor/anchors.txt" >> /dev/null;
	touch "/home/lweber/programing/bash/anchor/anchors.txt" >> /dev/null;
elif [ "$1" == 'list' ]; then 
	echo "Listing anchors:";
	touch "/home/lweber/programing/bash/anchor/anchors.txt" >> /dev/null;
	cat "/home/lweber/programing/bash/anchor/anchors.txt";
else 
	#echo "Anchor $1"
	dir=$(pwd)
	

	
	cat "/home/lweber/programing/bash/anchor/anchors.txt" | while read line 
	do
	#	echo "$line"
		lineArray=($(echo "$line" | tr " " "\n")); #note that weird double quotes needed for array assignment
		n=(${lineArray[0]});
		d=(${lineArray[1]});
		
		#echo "$n"
		#echo "$d"

		if [ "$n" = "$1" ]; then
			cd "$d/"
		fi
	done 

	#echo "$1 $dir" >> "/home/lweber/programing/bash/anchor/anchors.txt";
	exit 1;
fi

#problem: this thing needs to use static file locations for figuring out where it is  


















