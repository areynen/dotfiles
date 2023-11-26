#!/bin/sh
pgrep -x newsboat && notify-send "Newsboat is running." && exit 0
old=$(newsboat -x print-unread | awk '{print $1}')
notify-send "Updating newsboat..."
newsboat -x reload
new=$(newsboat -x print-unread | awk '{print $1}')
notify-send "Finished updating newsboat." "$((new-old)) new articles."
#pkill -RTMIN+3 dwmblocks
