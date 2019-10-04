#!/bin/bash

echo Cleanup

DIR="/media/clancon/diskAshur Pro2/fpc"
CAPACITY_LIMIT=95
if [ "$DIR" == "" ]
then 
	echo "ERROR: directory not specififed"
	exit 1
fi

if ! cd "$DIR"
then 
	echo "ERROR: unable to change directory into '$DIR'"
	exit 2
fi



CAPACITY=$(df -k . | awk '{gsub("%",""); capacity=$5}; END {print capacity}')

if [ $CAPACITY -gt $CAPACITY_LIMIT ]
then
	ls -rt | while read FILE
	do
		if [ -f $FILE ]
		then
			if rm -f $FILE
			then
				echo "Deleted $FILE"

				CAPACITY=$(df -k . | awk '{gsub("%",""); capacity=$5}; END {print capacity}')

				if [ $CAPACITY -le $CAPACITY_LIMIT ]
				then

					exit
				fi
			fi
		fi
	done
fi

find /pcaps/ -name '*' -type f -amin +10 -exec mv {} /media/clancon/diskAshur\ Pro2/fpc/ \;

