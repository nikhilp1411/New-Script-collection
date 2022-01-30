#!/bin/bash

#Desc:- This is a final script.
#Date :- 07 July 2020
#Written by :- Nikhil 

countdown()
(
  IFS=:
  set -- $*
  secs=$(( ${1#0} * 3600 + ${2#0} * 60 + ${3#0} ))
  while [ $secs -gt 0 ]
  do
    sleep 1 &
    printf "\r%02d:%02d:%02d" $((secs/3600)) $(( (secs/60)%60)) $((secs%60))
    secs=$(( $secs - 1 ))
    wait
  done
  echo
)
############################################################################

##Colours defined
Cyan='\e[36m'
#RED="\e[31m"
ORANGE="\e[33m"
BLUE="\e[94m"
GREEN="\e[92m"
Stop='\e[0m'

##Main script body

printf "${GREEN}"
printf "=================================\n"
printf "${BLUE}"
echo -e "\033[1mChecking..... number of .wmv files present in WebEx source\033[0m \n"
printf "${GREEN}"
printf "=================================\n"
printf "${STOP}"

printf "${ORANGE}"
countdown "00:00:05"
printf "${STOP}"


COUNT_WEBEX_SOURCE=$(ls -l /home/kpoint/webexsource/*.wmv | wc -l)

if [[ $COUNT_WEBEX_SOURCE -eq 0 ]]; then

printf "${Cyan}"
echo -e "\n\033[1mNo file present in WebEx source, please copy the file.\033[0m \n"
printf "${Stop}"

else

printf "${Cyan}"
echo -e "\n\033[1mCount of .wmv file present in WebEx source = ${COUNT_WEBEX_SOURCE}\033[0m \n"
printf "${Stop}"


printf "${Cyan}"
echo -e "\033[1mGood to go ahead\033[0m \n"
printf "${Stop}"

printf "${ORANGE}"
countdown "00:00:05"
printf "${STOP}"

printf "${GREEN}"
printf "=================================\n"
printf "${BLUE}"
echo -e "\n\033[1mChecking..... already present .wmv files in WebEx_Cogni_wmv\033[0m \n"
printf "${GREEN}"
printf "=================================\n"
printf "${STOP}"

printf "${ORANGE}"
countdown "00:00:05"
printf "${STOP}"

cd /WebEx/Cogni/wmv/

if [[ COUNT_WEBEX_COGNI_WMV=$(ls /WebEx/Cogni/wmv/ | wc -l) -eq 0 ]]; then

#if [[ $COUNT_WEBEX_COGNI_WMV -eq 0 ]]; then

printf "${Cyan}"
echo -e "\n\033[1mCount of files in WebEx_Cogni_wmv is ZERO\033[0m \n"
printf "${Stop}"

printf "${ORANGE}"
countdown "00:00:05"
printf "${STOP}"

printf "${Cyan}"
echo -e "\n\033[1mGood to copy files in WebEx_Cogni_wmv \033[0m \n"
printf "${Stop}"

printf "${ORANGE}"
countdown "00:00:05"
printf "${STOP}"

CP_WEBEX_COGNI_WMV=$(cp /home/kpoint/webexsource/*.wmv /WebEx/Cogni/wmv/)

$CP_WEBEX_COGNI_WMV

printf "${Cyan}"
echo -e "\n\033[1mCount of copied files in WebEx_Cogni_wmv = ${COUNT_WEBEX_SOURCE} \033[0m \n"
printf "${Stop}"

printf "${ORANGE}"
countdown "00:00:05"
printf "${STOP}"


printf "${Cyan}"
echo -e "\n\033[1mRplacing spaces from file name\033[0m \n"
printf "${Stop}"

printf "${ORANGE}"
countdown "00:00:05"
printf "${STOP}"

cd /WebEx/Cogni/wmv

sh replace_spaces.sh

printf "${ORANGE}"
countdown "00:00:05"
printf "${STOP}"

printf "${GREEN}"
printf "\n=================================\n\n"
printf "${STOP}"


printf "${Cyan}"
echo -e "\033[1mGood to go for python script\033[0m \n"
printf "${Stop}"


RUN_PYTHON_SCRIPT=$(python /opt/leopard/script/preprocess-webex-video.py -i /WebEx/Cogni/wmv/ -o /WebEx/Cogni/pro/)

$RUN_PYTHON_SCRIPT && echo OK

printf "${Cyan}"
echo -e "\n\033[1mScript has been excuted successfully\033[0m \n"
printf "${Stop}"

printf "${ORANGE}"
countdown "00:00:20"
printf "${STOP}"

### Copy and remove mp4 files

CP_WEBEX_OP_MP4=$(cp /WebEx/Cogni/pro/*.mp4 /home/kpoint/webexop)

$CP_WEBEX_OP_MP4 && echo ok

if [[ $? -eq 0 ]]; then

printf "${ORANGE}"
countdown "00:00:20"
printf "${STOP}"

printf "${Cyan}"
echo -e "\n\033[1mMP4 files copied in Webex op, please copy mp4 files on local machine\033[0m \n"
printf "${Stop}"

REMOVE_WEBEX_COGNI_MP4=$(rm -rf /WebEx/Cogni/pro/*.mp4)

$REMOVE_WEBEX_COGNI_MP4 && echo ok

printf "${Cyan}"
echo -e "\n\033[1mMP4 files removed successfully from WebEX_Cogni_pro\033[0m \n"
printf "${Stop}"

fi

##############################################################

else

printf "${Cyan}"
echo -e "\n\033[1mCount of existing files in WebEx_Cogni_wmv = ${COUNT_WEBEX_COGNI_WMV} \033[0m \n"
printf "${Stop}"

printf "${Cyan}"
echo -e "\033[1mRemoving existing files\033[0m \n"
printf "${Stop}"

printf "${ORANGE}"
countdown "00:00:05"
printf "${STOP}"

REMOVE_WEBEX_COGNI_WMV=$(rm -rf /WebEx/Cogni/wmv/*.wmv)

$REMOVE_WEBEX_COGNI_WMV

printf "${Cyan}"
echo -e "\n\033[1mExisting files removed successfully\033[0m \n"
printf "${Stop}"

printf "${ORANGE}"
countdown "00:00:05"
printf "${STOP}"

printf "${Cyan}"
echo -e "\n\033[1mGood to copy files in WebEx_Cogni_wmv \033[0m \n"
printf "${Stop}"

printf "${ORANGE}"
countdown "00:00:05"
printf "${STOP}"

CP_WEBEX_COGNI_WMV=$(cp /home/kpoint/webexsource/*.wmv /WebEx/Cogni/wmv/)

$CP_WEBEX_COGNI_WMV

printf "${Cyan}"
echo -e "\n\033[1mCount of copied files in WebEx_Cogni_wmv = ${COUNT_WEBEX_SOURCE} \033[0m \n"
printf "${Stop}"

printf "${ORANGE}"
countdown "00:00:05"
printf "${STOP}"

printf "${Cyan}"
echo -e "\n\033[1mRplacing spaces from file name\033[0m \n"
printf "${Stop}"

printf "${ORANGE}"
countdown "00:00:05"
printf "${STOP}"

cd /WebEx/Cogni/wmv

sh replace_spaces.sh

printf "${ORANGE}"
countdown "00:00:05"
printf "${STOP}"

printf "${GREEN}"
printf "\n=================================\n\n"
printf "${STOP}"

printf "${Cyan}"
echo -e "\033[1mGood to go for python script\033[0m \n"
printf "${Stop}"

RUN_PYTHON_SCRIPT=$(python /opt/leopard/script/preprocess-webex-video.py -i /WebEx/Cogni/wmv/ -o /WebEx/Cogni/pro/)

$RUN_PYTHON_SCRIPT && echo OK

printf "${Cyan}"
echo -e "\n\033[1mScript has been excuted successfully\033[0m \n"
printf "${Stop}"

printf "${ORANGE}"
countdown "00:00:20"
printf "${STOP}"

### Copy and remove mp4 files

CP_WEBEX_OP_MP4=$(cp /WebEx/Cogni/pro/*.mp4 /home/kpoint/webexop)

$CP_WEBEX_OP_MP4 && echo ok

if [[ $? -eq 0 ]]; then

printf "${ORANGE}"
countdown "00:00:20"
printf "${STOP}"

printf "${Cyan}"
echo -e "\n\033[1mMP4 files copied in Webex op, please copy mp4 files on local machine\033[0m \n"
printf "${Stop}"

REMOVE_WEBEX_COGNI_MP4=$(rm -rf /WebEx/Cogni/pro/*.mp4)

$REMOVE_WEBEX_COGNI_MP4 && echo ok

printf "${Cyan}"
echo -e "\n\033[1mMP4 files removed successfully from WebEX_Cogni_pro\033[0m \n"
printf "${Stop}"

fi

##############################################################

fi
fi

