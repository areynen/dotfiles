#!/bin/sh
pgrep -x thunar >/dev/null || thunar --daemon &
# Polkit
pgrep -x lxpolkit >/dev/null || lxpolkit &
# Theme
# wal --theme ~/theme >/dev/null
# screensaver
# pregp -x xscreensaver >/dev/null || xscreensaver --no-splash &
# dwmc xrdb
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
#mopidy &
#supersonic
# pgrep -x mpdscribble >/dev/null || mpdscribble &
# Unclutter to remove the mouse Top is arch, 2nd is debian
#pgrep -x unclutter >/dev/null || unclutter --jitter 1 --ignore-scrolling &
pgrep -x unclutter >/dev/null || unclutter -jitter 1 -ignore-scrolling &
# Stop PC Beep
xset -b &
xmodmap ~/.xmodmaprc &
#pgrep -x jellyfin-mpv-shim >/dev/null || jellyfin-mpv-shim --script-opts=webport='8000' &
blocks_program="dwmblocks"
sleep 3 & dwmblocks &
disown
