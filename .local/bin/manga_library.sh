#!/bin/sh
ls ~/Manga/ | dmenu -l 20 -i | xargs -I % mass_function.sh /home/alex/Manga/%/ manga_read.sh
