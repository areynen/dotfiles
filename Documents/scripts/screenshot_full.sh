dir=$HOME"/Pictures/screenshots/"
case "$(printf "1. A selected area\\n2. Current window\\n3. Full screen\\n4. A selected area (copy)\\n5. Current window (copy)\\n6. Full screen (copy)" | dmenu -bw 2 -c -l 6 -i -p "Screenshot which area?")" in
    "1. A selected area") maim -s $dir"pic-selected-$(date '+%y%m%d-%H%M-%S').png" ;;
    "2. Current window") maim -i "$(xdotool getactivewindow)" $dir"pic-window-$(date '+%y%m%d-%H%M-%S').png" ;;
    "3. Full screen") maim $dir"pic-full-$(date '+%y%m%d-%H%M-%S').png" ;;
    "4. A selected area (copy)") maim -s | xclip -selection clipboard -t image/png ;;
    "5. Current window (copy)") maim -i "$(xdotool getactivewindow)" | xclip -selection clipboard -t image/png ;;
    "6. Full screen (copy)") maim | xclip -selection clipboard -t image/png ;;
esac
