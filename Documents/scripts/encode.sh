#!/bin/sh
for file in *.mkv
do
  ffmpeg -i "$file" "_$file"
done
