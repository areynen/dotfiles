eval $(xdotool getwindowfocus getwindowgeometry --shell)
xdotool mousemove $((X + WIDTH / 2)) $((Y + HEIGHT / 2))
