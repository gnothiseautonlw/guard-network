#!/bin/bash

LOGFILE=/var/log/guard-network.log
echo "Starting guard-services" > $LOGFILE

fail=0
while true; do
	sudo ping -c 1 -w 10 google.com &>/dev/null
	error=$?
	if [ $error -eq 0 ]; then
		fail=0
		echo "[  OK  ] - `date +%T` -  Host is up" >> $LOGFILE
		while [ $error -eq 0 ]; do
			sleep 15
			sudo ping -c 1 -w 10 google.com &> /dev/null
			error=$?
			if [ $error -eq 2 ]; then
				echo "[ FAIL ] - `date +%T` -   Host down (error: $error)." >> $LOGFILE
				fail=1
			fi
		done
	else
		echo "[ FAIL ] - `date +%T` -   Host down (error: $error)." >> $LOGFILE
		let "fail=fail+1"
		if [ $fail -ge 2 ]; then
			echo "Restarting netplan..." >> $LOGFILE
			sudo netplan apply &> /dev/null
			echo "[  OK  ] - `date +%T` - Restarted" >> $LOGFILE
			echo "Stopping guard-services for 3 minutes" >> $LOGFILE
			sleep 165 #Do nothing for 3 min
		fi
	fi
	sleep 15
done
