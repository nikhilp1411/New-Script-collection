#!/bin/bash

#assign the first argument ($1) as the filename
file_count=`ls  /WebEx/Cogni/pro/ | wc -l`


if [[ COUNT_WEBEX_COGNI_pro=$(ls  /WebEx/Cogni/pro/ | wc -l) -gt 20 ]]; then
    echo "CRITICAL:" $file_count "files"
    exit 2 #returns critical status because your worst scenario is that the file doesn't even exist


elif [[ COUNT_WEBEX_COGNI_WMV=$(ls  /WebEx/Cogni/pro/ | wc -l) -gt 10 ]]; then
    echo "WARNING:" $file_count "files"
    exit 1 #returns warning status because this state is better than having no file at all

else
    echo "OK:" $file_count "files"
    exit 0 #Return OK status
fi
fi

check_webex_pro_count