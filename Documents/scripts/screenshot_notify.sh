#!/bin/sh
ACTION=$(dunstify --action="preview,Preview" "Screenshot Taken" -i ~/Pictures/screenshots/$(ls ~/Pictures/screenshots -Art | tail -n 1))

case "$ACTION" in
"preview")
    openlatest.sh
    ;;
"2")
    ;;
esac
