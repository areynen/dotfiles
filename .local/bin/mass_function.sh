#!/bin/bash
tmp="/tmp/mf.txt"
[ -s "$tmp" ] && rm $tmp

if [ -z "$*" ]; then
    echo "pass in a dir, then command, finally, optionally an index to start at, ie. ./mass_function.sh ~/dir mpv 3"
    exit
fi


dir=$(echo "$@" | awk -F " " '{$NF=" "; print $0}' | sed 's/..$//')
cmd=$(echo "$@" | awk -F " " '{print $(NF)}')

# echo "dir: $dir"
# echo "cmd: $cmd"

if [ -e "$dir"return.txt ]; then
    file=$(awk -F "/" '{print $(NF)}' "$dir"return.txt)
    # echo "$file"
    ctr=$(ls "$dir" | sed -n '0,/'"$file"'/p' | wc -l)
    # echo "$ctr"
    index=$((ctr - 1))
else
    index=$3
fi
[ -s "$dir"return.txt ] && rm "$dir"return.txt

# echo "$index"

find "$dir" -maxdepth 1 -mindepth 1 | while read -r LINE; do echo "$cmd \"$LINE\" || (echo \"$LINE\"; exit 1) && " >>"$tmp"; done
sort -Vo $tmp $tmp

if [ -n "$index" ]; then
    count=$(find "$dir" -maxdepth 1 -mindepth 1 | wc -l)
    tail_count=$(("$count" - "$index"))
    if [ "$tail_count" -lt 0 ]; then
        echo "Index is too large, exiting"
        exit
    fi
    sed -i 1,"$index"d /tmp/mf.txt
fi

list=$(cat "$tmp" | while read -r LINE; do echo -n "$LINE "; done)
list=${list%????}
# echo $list
rm $tmp
sh -c "$list" >"$dir"return.txt

if [ -s "$dir"return.txt ]; then
    echo "$(head -1 "$dir"return.txt)" >"$dir"return.txt
else
    [ -s "$dir"return.txt ] && rm "$dir"return.txt
fi
