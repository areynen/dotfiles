#!/bin/sh
# Polkit
pgrep -x lxpolkit >/dev/null || lxpolkit &
# Wallpaper
# feh --bg-scale ~/Pictures/wallpaper_new.png &
sleep 1 & hsetroot -solid "#282828"
# Setting screens
~/.screenlayout/dual-offset-home.sh
# Theme
# wal --theme ~/theme >/dev/null
# dwmc xrdb
xrdb ~/.Xresources
# Picom compositor
pgrep -x picom >/dev/null || picom &
# Dunst notifcations
pgrep -x dunst >/dev/null || dunst &
# Clipboard manager
#pgrep -x parcellite >/dev/null || parcellite -n &
pgrep -x clipmenud >/dev/null || clipmenud &
# DWM Blocks
#if (pgrep -x dwm)
#then
#    blocks_program="dwmblocks"
#    dwmblocks &
#elif (pgrep -x i3)
#then
#    blocks_program="i3blocks"
#    i3blocks &
#else
#    exit
#fi
# sxhkd startup
pgrep -x sxhkd >/dev/null || sxhkd &
# MPD
# mpd &
mopidy &
# pgrep -x mpdscribble >/dev/null || mpdscribble &
# Unclutter to remove the mouse Top is arch, 2nd is debian
#pgrep -x unclutter >/dev/null || unclutter --jitter 1 --ignore-scrolling &
pgrep -x unclutter >/dev/null || unclutter -jitter 1 -ide 3 &
# Stop PC Beep
xset -b &
xmodmap ~/.xmodmaprc &
#pgrep -x jellyfin-mpv-shim >/dev/null || jellyfin-mpv-shim --script-opts=webport='8000' &
blocks_program="dwmblocks"
sleep 3 & dwmblocks &
disown
