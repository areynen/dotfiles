#!/usr/bin/env bash

##################################
# Set up music (ws10)
# exec --no-startup-id i3-msg "workspace $ws10; append_layout /home/alex/.layouts/layout-MUSICART.json"
# exec --no-startup-id lsblk
# exec --no-startup-id urxvt -name cmus -e cmus
# # exec --no-startup-id urxvt -name cava -e cava
# exec --no-startup-id sleep 1; urxvt -name cava -e cava
# exec --no-startup-id ~/.config/cmus/./cover.sh
# exec --no-startup-id sleep 1; i3-msg "workspace $ws10"; i3-layout-manager MUSICART
##################################


ws1="1"
ws10="10. Music ﱘ"

i3-msg "workspace $ws10"
i3-layout-manager MUSICART
i3-msg "exec --no-startup-id lsblk"
i3-msg "exec --no-startup-id urxvt -name cmus -e cmus"
i3-msg "exec --no-startup-id urxvt -name cava -e cava"
i3-msg "exec --no-startup-id ~/.config/cmus/./cover.sh"
sleep 1
i3-layout-manager MUSICART

#i3-msg "workspace $ws1"
