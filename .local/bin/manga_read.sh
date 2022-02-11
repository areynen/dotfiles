#!/bin/sh
feh --info "echo %u/%l && echo %F | grep -Eo 'c[0-9]+(|\.[0-9]+)'" --full-screen --auto-zoom --on-last-slide quit "$1"
