#!/bin/bash
last_dl=`cd ~/Downloads && ls -t . | head -n 1 | xargs realpath`
mv -vi ${last_dl} .
