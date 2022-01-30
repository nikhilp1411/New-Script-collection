#Date :- 22/07/2020
#Info:- This script is use to remove from wmv files from webexsource and mp4 files from webexop
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
ORANGE="\e[33m"
BLUE="\e[94m"
GREEN="\e[92m"
Stop='\e[0m'

##Main script body

cd /home/kpoint/webexsource/

printf "${GREEN}"
printf "=================================\n"
printf "${BLUE}"
echo -e "\033[1mRemoving File from WebExsource\033[0m \n"
printf "${GREEN}"
printf "=================================\n"
printf "${STOP}"

printf "${ORANGE}"
countdown "00:00:05"
printf "${STOP}"


if [[ COUNT_WEBEX_SOURCE=$(ls /home/kpoint/webexsource/ | wc -l) -eq 0 ]]; then

printf "${Cyan}"
echo -e "\n\033[1mNo wmv file to remove\033[0m \n"
printf "${Stop}"

printf "${ORANGE}"
countdown "00:00:05"
printf "${STOP}"

cd /home/kpoint/webexop/

printf "${GREEN}"
printf "=================================\n"
printf "${BLUE}"
echo -e "\033[1mRemoving File from WebExop\033[0m \n"
printf "${GREEN}"
printf "=================================\n"
printf "${STOP}"

if [[ COUNT_WEBEX_OP=$(ls /home/kpoint/webexop/ | wc -l) -eq 0 ]]; then
 
printf "${Cyan}"
echo -e "\n\033[1mNo mp4 file to remove\033[0m \n"
printf "${Stop}"

else

REMOVE_WEBEX_OP=$(rm -rf /home/kpoint/webexop/*.mp4)

printf "${Cyan}"
echo -e "\n\033[1mFile removed successfully from WebExOp\033[0m \n"
printf "${Stop}"

fi


else

REMOVE_WEBEX_SOURCE=$(rm -rf /home/kpoint/webexsource/*.wmv)

printf "${Cyan}"
echo -e "\n\033[1mFile removed successfully from WebExsource\033[0m \n"
printf "${Stop}"

printf "${ORANGE}"
countdown "00:00:05"
printf "${STOP}"

cd /home/kpoint/webexop/

printf "${GREEN}"
printf "=================================\n"
printf "${BLUE}"
echo -e "\033[1mRemoving File from WebExop\033[0m \n"
printf "${GREEN}"
printf "=================================\n"
printf "${STOP}"

if [[ COUNT_WEBEX_OP=$(ls /home/kpoint/webexop/ | wc -l) -eq 0 ]]; then

printf "${Cyan}"
echo -e "\n\033[1mNo file mp4 file to remove\033[0m \n"
printf "${Stop}"

else

REMOVE_WEBEX_OP=$(rm -rf /home/kpoint/webexop/*.mp4)

printf "${Cyan}"
echo -e "\n\033[1mFile removed successfully from WebExOp\033[0m \n"
printf "${Stop}"

fi
fi
