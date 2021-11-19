#!/usr/bin/env bash

#https://medium.com/@sean.nicholas/how-i-remapped-my-keyboard-to-have-a-better-developer-experience-1323424c62b8
#xmodmap -e "keycode [YOUR KEYCODE] = [KEY] [SHIFT + KEY] [ALT + KEY] [ALT + SHIFT + KEY] [ALT GR + KEY] [ALT GR + SHIFT + KEY]"
# Numbers first row
xmodmap -e "keycode 17 = 8 bar"
xmodmap -e "keycode 18 = 9 backslash"
# Umlaut üöä >
xmodmap -e "keycode 34 = braceleft braceright udiaeresis Udiaeresis udiaeresis Udiaeresis"
xmodmap -e "keycode 47 = parenleft parenright odiaeresis Odiaeresis odiaeresis Odiaeresis"
xmodmap -e "keycode 48 = bracketleft bracketright NoSymbol NoSymbol adiaeresis Adiaeresis"

echo "Switched to coding keyboard."
