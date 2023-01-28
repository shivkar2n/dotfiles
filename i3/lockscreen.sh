#!/bin/bash

scrot ~/Pictures/Lockscreen/screen_locked2.png

TMPBG=~/Pictures/Lockscreen/screen_locked2.png
LOCK=~/Pictures/Lockscreen/screen_locked.png
RES=1920x1080
 
convert $TMPBG -filter Gaussian -blur 0x16 $LOCK
rm -r $TMPBG

 
i3lock -i $LOCK -u && sleep 5 && xset s activate

