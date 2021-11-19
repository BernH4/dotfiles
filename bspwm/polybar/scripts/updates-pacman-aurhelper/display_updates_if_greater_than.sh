updates=$(cat ~/.config/bspwm/polybar/scripts/updates-pacman-aurhelper/updatecount.txt)
if [ "$updates" -gt $1 ]
then
  echo "$updates"
else
  echo ""
fi

