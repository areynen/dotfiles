#!/usr/bin/env bash

##################################
# exec --no-startup-id i3-msg "workspace $ws8; append_layout /home/alex/.layouts/layout-SOCIAL.json"
# exec --no-startup-id discord
# exec --no-startup-id thunderbird
##################################


ws1="1"
ws8="8. Socials "

i3-msg "workspace $ws8"
i3-layout-manager SOCIAL
i3-msg "exec --no-startup-id discord"
i3-msg "exec --no-startup-id thunderbird"
sleep .5

i3-msg "workspace $ws1"
