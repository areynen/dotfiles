#!/usr/bin/sh
dir=$HOME"/Pictures/screenshots/"
save=$dir"copied.png"
case "$(printf "1. A selected area\\n2. Current window\\n3. Full screen\\n4. A selected area (copy)\\n5. Current window (copy)\\n6. Full screen (copy)\\n7. A selected area 1 sec delay" | dmenu -bw 2 -c -l 7777777 -i -p "Screenshot which area?")" in
    "1. A selected area") maim -s "$dir""pic-selected-$(date '+%y%m%d-%H%M-%S').png" ;;
    "2. Current window") maim -i "$(xdotool getactivewindow)" "$dir""pic-window-$(date '+%y%m%d-%H%M-%S').png" ;;
    "3. Full screen") maim "$dir""pic-full-$(date '+%y%m%d-%H%M-%S').png" ;;
    "4. A selected area (copy)") maim -s -u $save; cat $save | xclip -selection clipboard -t image/png ;;
    "5. Current window (copy)") maim -i "$(xdotool getactivewindow)" $save; cat $save | xclip -selection clipboard -t image/png ;;
    "6. Full screen (copy)") maim $save; cat $save | xclip -selection clipboard -t image/png ;;
    "7. A selected area 1 sec delay") sleep 1; maim "$dir""pic-full-$(date '+%y%m%d-%H%M-%S').png"; feh ~/Pictures/screenshots/$(ls ~/Pictures/screenshots -Art | tail -n 1) --class=fehfloat -Z -F ;;
esac
screenshot_notify.sh 
