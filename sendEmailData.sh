#!/bin/bash

MAIL_FROM="abc@mnp.com"
MAIL_TO="abc@mnp.com"
MAIL_CC="abc@mnp.com"
MAIL_FROM_ID="abc"
MAILSERVER="smtp.com"
SUBJECT_LINE="Alert"
FILE_MSG="/tmp/msg.txt"

usage()
{
 echo "$0 -f <fromAddress> -t <toAddress> -c <toCCAddress> -s <subject> -b <mailContents>"
 exit 1;
}

mail_status()
{
if [ ${MYMAP[TO]+_} ]; then
 MAIL_TO=${MYMAP[TO]}
fi
if [ ${MYMAP[FROM]+_} ]; then
 MAIL_FROM=${MYMAP[FROM]}
 MAIL_FROM_ID=$MAIL_FROM
fi
if [ ${MYMAP[CC]+_} ]; then
 MAIL_CC=${MYMAP[CC]}
fi
if [ ${MYMAP[SUBJECT]+_} ]; then
 SUBJECT_LINE=${MYMAP[SUBJECT]}
fi
MESSAGE=`cat $FILE_MSG`
if [ ${MYMAP[BODY]+_} ]; then
 MESSAGE=${MYMAP[BODY]}
fi

echo " Calling Mail"

FILE_MAIL="
HELO localhost
MAIL FROM: $MAIL_FROM
RCPT TO: $MAIL_TO
RCPT TO: $MAIL_CC
DATA
FROM: $MAIL_FROM_ID
TO: $MAIL_TO
Cc: $MAIL_CC
Subject: $SUBJECT_LINE $1
Hi All,

$MESSAGE


quit
"
        echo "${FILE_MAIL}" | nc $MAILSERVER  > /dev/null  2>&1

}
declare -A MYMAP
while getopts "f:t:c:s:b:" o; do
    case "${o}" in
        f)
            MYMAP[FROM]=${OPTARG}
            ;;
        t)
            MYMAP[TO]=${OPTARG}
            ;;
        c)
            MYMAP[CC]=${OPTARG}
            ;;
        s)
            MYMAP[SUBJECT]=${OPTARG}
            ;;
        b)
            MYMAP[BODY]=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
echo $MYMAP
mail_status