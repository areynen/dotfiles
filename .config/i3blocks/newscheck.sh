#!/bin/sh

icon=""
count=$(newsboat -x print-unread | awk '{print $1}')
pgrep -x "newsboat" >> /dev/null && count="-"

echo "$icon $count"

case $BLOCK_BUTTON in
    1) $TERMINAL -e newsboat && blocks_update 3;;
    2) blocks_update 3;;
    3) updatenews.sh ;; 
    6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

