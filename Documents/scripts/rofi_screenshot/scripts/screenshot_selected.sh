#!/usr/bin/env bash

# $mod+shift+s exec maim -s --format png /dev/stdout | xclip -selection clipboard -t image/png -i

maim -s --format png /tmp/screenshot.png
xclip -selection clipboard -t image/png -i /tmp/screenshot.png
(ls /tmp/screenshot.png && notify-send "Screenshot Saved to Clipboard" --icon=/tmp/screenshot.png) ||
sleep .1
rm /tmp/screenshot.png
