#!/bin/bash

lastbackup=`ssh pi ls -tr /home/pi/backups/raspberrypi | egrep -v '(last|log)'`
quelle=pi:/home/pi/backups/raspberrypi/$lastbackup
ziel=/home/bs/backups/raspberrypi/
rsync  -aviiR -hh --rsync-path="sudo rsync" --delete "${quelle}"  "${ziel}${lastbackup}/" --link-dest="${ziel}last/"
ln -nsf "${ziel}${heute}" "${ziel}last"

exit 0
