#!/usr/bin/env bash

# https://medium.com/@sean.nicholas/how-i-remapped-my-keyboard-to-have-a-better-developer-experience-1323424c62b8
# Numbers first row 89
xmodmap -e "keycode 17 = 8 parenleft NoSymbol NoSymbol bracketleft"
xmodmap -e "keycode 18 = 9 parenright NoSymbol NoSymbol bracketright"
# Umlaut üöä
xmodmap -e "keycode 34 = udiaeresis Udiaeresis"
xmodmap -e "keycode 47 = odiaeresis Odiaeresis"
xmodmap -e "keycode 48 = adiaeresis Adiaeresis"

echo "Switched to normal keyboard."
