#!/bin/sh


getmon1=`xrandr | grep " connected" | grep eDP`
mon1=`echo $getmon1 | awk '{ print $1 }'`

getmon2=`xrandr | grep " connected" | grep HDMI`
mon2=`echo $getmon2 | awk '{ print $1 }'`

xrandr \
  --output $mon1 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
  --output $mon2 --off --mode 1920x1080 --pos 1920x0 --rotate normal

# i3-msg reload
