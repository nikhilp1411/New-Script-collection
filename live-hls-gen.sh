#!/bin/bash

# generates ts and hls playlist for live event

LOGDIR=/var/log/leopard
LOGFILE=$LOGDIR/ms/aveditor.log

DEPLOY_ROOT=/usr/local/leopard
FFMPEG_HOME=$DEPLOY_ROOT/contrib/ffmpeg-1.2.1
FFMPEG=$FFMPEG_HOME/bin/ffmpeg
FLV_SEG=/usr/local/leopard/scripts/flvseg.sh
LIVE_HLS_PL=/usr/local/leopard/scripts/video/live-hls-pl.py

FFMPEG_OPTS="-y"

#SUDO_CMD="/usr/bin/sudo -u leopard"
SUDO_CMD="/usr/bin/sudo -u root"

#
# log to file
#
log2() {
    LC_MESSAGE=$1
    LC_LOGFILE=$2

    if [ "X$LC_LOGFILE" == "X" ]; then
        echo "log(): LOGFILE not specified!"
        exit 1
    fi

    if [ "X$LC_MESSAGE" == "X" ]; then
        echo "log(): MESSAGE not specified!"
        exit 1
    fi

    LC_DATE=`date +"%Y-%m-%d %H:%M:%S"`
    echo $LC_DATE live-hls-gen: $LC_MESSAGE >> $LC_LOGFILE

    return 0
}

#
# usage instructions
#
usage() {
    cat <<EOF
Usage: live-hls-gen.sh -i <inFile> -d <outDir>
EOF
    exit 9
}

# begin

log2 "------------------- starting -------------------" $LOGFILE

while getopts "i:d:h" options; do
    case $options in
        i ) inFile=$OPTARG;;
        d ) outDir=$OPTARG;;
        h ) usage;;
  esac
done


if [ "X$inFile" == "X" \
        -o "X$outDir" == "X" ]; then
    usage
fi


$SUDO_CMD mkdir -p $outDir

log2 "creating new dir: $outDir" $LOGFILE

cd $outDir

$SUDO_CMD $FLV_SEG -i $inFile | $FFMPEG -i pipe:0 -acodec libfaac -r 30 -g 150 -s 640:360 -vcodec libx264 -f flv - 2> $LOGFILE | $FFMPEG -i pipe:0 -f segment -map 0 -acodec copy -vbsf h264_mp4toannexb -vcodec copy -segment_time 5 -segment_list pl.m3u8 -segment_format mpegts seg-%d.ts >> $LOGFILE 2>&1 &

#$SUDO_CMD cat /opt/leopard/avijit/avijit/cts-live.flv | $FFMPEG -i pipe:0 -acodec libfaac -r 30 -g 150 -s 640:360 -vcodec libx264 -f flv - 2> $LOGFILE | $FFMPEG -i pipe:0 -f segment -map 0 -acodec copy -vbsf h264_mp4toannexb -vcodec copy -segment_time 5 -segment_list pl.m3u8 -segment_format mpegts seg-%d.ts >> $LOGFILE 2>&1 &

$SUDO_CMD echo "<video src="livepl.m3u8" controls/>" > live.html

$SUDO_CMD python $LIVE_HLS_PL pl.m3u8 livepl.m3u8  >> $LOGFILE 2>&1

exit 0
