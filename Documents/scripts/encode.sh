#!/bin/sh
for file in *.mkv
do
  ffmpeg -i "$file" "encode/$file"
done
