#!/bin/sh

status=$(mullvad status | awk 'NR==1 {print $1}')
#echo "$status"
case $status in
        "Connected") icon="" ;; 
        "Connecting") icon="" ;;
        "Disconnected") icon="" ;;
esac

case $BLOCK_BUTTON in
    1) /opt/Mullvad\ VPN/mullvad-gui ;;
    2) mullvad reconnect && "$HOME/.local/bin/blocks_update" 2 ;;
    3) if [ "$status" = "Disconnected" ]; then mullvad connect; else mullvad disconnect; fi ;;
    6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac


echo " VPN: $icon"
