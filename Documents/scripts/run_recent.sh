#!/bin/sh
# end a command with ; to run in a terminal

term="st -e"
cachedir=${XDG_CACHE_HOME:-"$HOME/.cache"}
cache="$cachedir/dmenu_recent"

touch "$cache"

most_used=$(sort "$cache" | uniq -c | sort -r | cut -d" " -f8)
run=$((echo "$most_used"; dmenu_path | grep -vxF "$most_used") | dmenu -c -h 20 -l 20 -bw 2 -fn "SauceCodePro Nerd Font Mono" -p Run: -i "$@")
([ -z "$run" ] || echo "$run"; head -n 99 "$cache") > "$cache.$$"
mv "$cache.$$" "$cache"

case "$run" in
    *\;) exec $(echo $term ${run%;}) ;;
    *)   exec "$run" ;;
esac
