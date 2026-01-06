#!/bin/sh
song_title=$(playerctl --player=Supersonic metadata title)
song_artist=$(playerctl --player=Supersonic metadata artist)
song_album=$(playerctl --player=Supersonic metadata album)
song_art=$(playerctl --player=Supersonic metadata mpris:artUrl)


song_progress=$(playerctl --player=Supersonic metadata --format '{{duration(position)}}/{{duration(mpris:length)}}')


dunstify "Supersonic - Jellyfin" "$song_title\n$song_artist\n$song_progress" -i "$song_art"
