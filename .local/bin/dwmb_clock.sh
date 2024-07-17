#!/bin/sh
case $BLOCK_BUTTON in
    #1) notify-send "This Month" "$(cal --color=always | sed "s/..7m/<b><span color=\"red\">/;s/..27m/<\/span><\/b>/")" ;;
    1) notify-send "This Month" "$(cal | sed "s/\<$(date +'%e'|sed 's/ //g')\>/<b><span color='red'>&<\/span><\/b>/")" ;;
    2) ;;
    3) notify-send "Three Months" "$(cal $(date -d "-1 month" +"%B %Y"))\n$(cal | sed "s/\<$(date +'%e'|sed 's/ //g')\>/<b><span color='red'>&<\/span><\/b>/")\n$(cal $(date -d "+1 month" +"%B %Y"))" ;;
    #3) notify-send "Three Months" "$(cal $(date -d "-1 month" +"%B %Y"))\n$(cal --color=always | sed "s/..7m/<b><span color=\"red\">/;s/..27m/<\/span><\/b>/" )\n$(cal $(date -d "+1 month" +"%B %Y"))" ;;
    6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

d=$(date "+%Y %b %d (%a) %I:%M%p")
echo ' '$d

