#!/bin/bash
last_dl=`cd ~/Downloads && ls -t . | head -n 1 | xargs realpath`
basename=`basename ${last_dl}`
echo $basename

# pictures="[.*\.(gif|jpe?g|bmp|png)]"
# pictures="[(gif|jpe?g|bmp|png)$]"
# regex="([^\\s]+(\\.(?i)(jpe?g|png|gif|bmp))$)";
# if [[ $basename =~ $regex ]]
# then
mv -vi ${last_dl} ~/Pictures
feh --bg-scale ~/Pictures/${basename}
# else
#   echo "${basename} is not an image, abort!"
#   exit
# fi
