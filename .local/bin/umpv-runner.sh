#!/bin/sh
export MPV="mpv ytdl-format='bestvideo[ext=mp4][height=720][vcodec^=avc][fps<=30]+bestaudio/best'"
umpv "$2" &
