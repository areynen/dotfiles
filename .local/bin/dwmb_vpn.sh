#!/bin/sh

status=$(mullvad status | awk 'NR==1 {print $1}')
#echo "$status"
case $status in
        "Connected") icon="" ;; 
        "Disconnected") icon="" ;;
        *) icon="" ;;
esac

case $BLOCK_BUTTON in
    1) /opt/Mullvad\ VPN/mullvad-gui ;;
    2) mullvad reconnect && "$HOME/.local/bin/blocks_update" 2 ;;
    3) if [ "$status" = "Connected" ]; then mullvad disconnect; else mullvad connect; fi ;;
    6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac


echo " VPN: $icon"
