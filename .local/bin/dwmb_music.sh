#!/bin/sh
title=$(mpc current)
#progress=$(mpc status | head -2 | tail -1 | awk '{print $3}')
status=$(mpc status | head -2 | tail -1 | awk '{print $1}')
TERMINAL=st


case "$status" in
    "[playing]") icon="  ";;
    "[paused]") icon="  ";;
esac

case $BLOCK_BUTTON in
    1) $TERMINAL -c ncmpcpp -e ncmpcpp ;;
    2) mpc toggle && $HOME/.local/bin/blocks_update 2;;
    3) $HOME/.local/bin/mpcnotify.sh ;;
    4) $HOME/.local/bin/mopidy_vol +5 ;;
    # 4) mpc volume +5 ;;
    5) $HOME/.local/bin/mopidy_vol -5 ;;
    # 5) mpc volume -5 ;;
    6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac


#echo ' ' "$icon" "$title" '-' "$progress"
echo "$icon""$title"

