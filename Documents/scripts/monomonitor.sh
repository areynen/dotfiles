#!/bin/sh
killall -q polybar
sh ~/.screenlayout/mono.sh
feh --bg-center ~/Pictures/wallpaper.png
polybar bar1 &
