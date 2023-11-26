#!/bin/sh
export MPV="mpv --ytdl-format=bestvideo[height<=$1][fps<=?30]+bestaudio/worst"
umpv "$2" &
