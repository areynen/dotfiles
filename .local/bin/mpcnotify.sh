#!/bin/sh
musicdir="$HOME/Music"
songloc="$(mpc --format '%file%' current)"
dir="${songloc%/*}"
cover=$(ls "$musicdir/$dir"/* -d | grep ".jpg\|.png" | head -n 1)
# echo $cover
state=$(mpc status | awk -F'[][]' 'FNR==2{print toupper(substr($2,1,1)) substr($2,2)}')
dunstify "$state" "$(mpc --format '%title% \n%artist% - %album%' current)" -i "$cover"
