#!/bin/bash
inputfile=$1
ffmpeg -i $inputfile -id3v2_version 3 -metadata artist="Rain" -map 0:0 -map_metadata -1 -ar 22050 -ab 64k /tmp/output.mp3
if [ $? -eq 0 ];then
    mp3gain -r /tmp/output.mp3
    if [ $? -eq 0 ];then
        mv /tmp/output.mp3  $inputfile
    else
       echo "!!!!!Install mp3gain firstly!!!!!"
    fi
else
    echo "!!!!!Install ffmpeg firstly!!!!!"
fi

