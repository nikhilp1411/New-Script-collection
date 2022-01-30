#!/bin/bash
#Author:-Nikhil
#Date:- 09/07/2021
#Desc:- This script shows the current video conversion in progerss using ffmpeg and started at time and process id
##################################################################################################################

Cyan='\e[36m'
Stop='\e[0m'

SERVICE="ffmpeg"
CNT=$(ls -l /WebEx/Cogni/wmv/*.wmv | wc -l)
CURRENT_VID=$(ps aux | grep ffmpeg | awk FNR==1'{print $13}' | cut -b 18-)
STARTED=$(ps aux | grep ffmpeg | awk FNR==1'{print $9}')
CHANGE_CURRENT_VID_EXT=${CURRENT_VID%.wmv}.mp4
ACTUAL_MP4_COUNT=$(ls -l /WebEx/Cogni/pro/*.mp4 | awk '{ if ( /'${CHANGE_CURRENT_VID_EXT}'/ && !seen ) { seen = 1 } else print }' | wc -l)

#begin
printf $Cyan
echo -e '\033[1mNo. of video for conversion:\033[0m'
printf $Stop
echo $CNT
echo
printf $Cyan
echo -e '\033[1mIs script is in progress?\033[0m'
printf $Stop
	if pgrep -x "$SERVICE" >/dev/null
	then
	echo Yes. Script is running and video conversion in progres
	echo
	printf $Cyan
	echo -e '\033[1mCurrent video in progress :: Script start timing\033[0m'
	printf $Stop
	echo $CURRENT_VID :: $STARTED
	echo
	printf $Cyan
	echo -e '\033[1mNo. of video converted to .MP4:\033[0m'
	printf $Stop
	echo $ACTUAL_MP4_COUNT
	echo 
	else
	echo No. Script is not running
	fi

