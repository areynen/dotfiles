#!/bin/bash

pidof dunst && killall dunst
dunst &

notify-send "Dunst message 1"
sleep 1;
notify-send "Dunst message 2"
