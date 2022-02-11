#!/bin/sh
temp="/tmp/tmp.txt"
title=$(awk -F " - " '/Title:/ {print $(NF-1)}' /tmp/tmp.txt | cut -f2- -d " ")
url=$(grep "Link:" "$temp" | cut -d' ' -f 2-)

if echo "$url" | grep "mangadex" -q
    # then mangadex-dl.py -c "$url" -t "$title" -i yes 2> "$temp"
    then mangadex-dl-mini.py "$url" 2> "$temp"
elif echo "$url" | grep "manga4life" -q
    then manga4life-dl.py "$url" 2> "$temp"
elif echo "$url" | grep "catmanga" -q
    then catmanga-dl.py "$url" 2> "$temp"
else
    echo "No Downloader"
    exit
fi
dir=$(awk '/\/home\/alex\/Manga/ {print}' /tmp/tmp.txt)
if [ "$dir" != "" ];then
    echo "$dir;manga_read.sh" >> /home/alex/Documents/scripts/to_consume.txt
fi
rm $temp
