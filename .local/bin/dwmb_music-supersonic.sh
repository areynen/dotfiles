#!/bin/sh
song_title=$(playerctl --player=Supersonic metadata title)
song_artist=$(playerctl --player=Supersonic metadata artist)
song_album=$(playerctl --player=Supersonic metadata album)
song_art=$(playerctl --player=Supersonic metadata mpris:artUrl)

#echo "title:" "$song_title"
#echo "artist:" "$song_artist"
#echo "album:" "$song_album"
#feh "$song_art"

title="${song_artist:+$song_artist - }$song_title"
#echo "$title"  
#progress=$(mpc status | head -2 | tail -1 | awk '{print $3}')
#status=$(mpc status 2> /dev/null | head -2 | tail -1 | awk '{print $1}')
status=$(playerctl --player=Supersonic status)
TERMINAL=st


case "$status" in
    "Playing") icon="  ";;
    "Paused") icon="  ";;
esac

case $BLOCK_BUTTON in
    1) supersonic ;;
    2) playerctl --player=Supersonic play-pause && $HOME/.local/bin/blocks_update 2;;
    #2) mpc toggle && $HOME/.local/bin/blocks_update 2;;
    3) $HOME/.local/bin/supersonicnotify.sh ;;
    4) playerctl --player=Supersonic volume 0.05+ ;;
    # 4) mpc volume +5 ;;
    5) playerctl --player=Supersonic volume 0.05- ;;
    # 5) mpc volume -5 ;;
    6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac


#echo ' ' "$icon" "$title" '-' "$progress"
echo "$icon""$title" 2> /dev/null

