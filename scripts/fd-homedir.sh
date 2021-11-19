#!/usr/bin/bash
# xdg-open "$(fd --hidden --type file . /home/$USER/ | rofi -threads 0 -width 90 -dmenu -i -p "fd")"
 alacritty -e nvim "$(fd --hidden --type file . /home/$USER/ | rofi -threads 0 -width 50 -dmenu -i -p "locate:")"
