#!/bin/sh

getmon1=`xrandr | grep " connected" | grep eDP`
mon1=`echo $getmon1 | awk '{ print $1 }'`

# getmon2=`xrandr | grep " connected" | grep HDMI`
# mon2=`echo $getmon2 | awk '{ print $1 }'`
mon2="DP-1-1"

# xrandr --verbose \
#   --output $mon1 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
#   --output $mon2 --mode 1920x1080_60 --crtc 0 --pos 1920x0 --rotate normal

echo "MON1 $mon1"

xrandr --verbose \
  --output $mon1 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
  --output $mon2 --mode 1920x1080_60 --crtc 0 --pos 1920x0 --rotate normal

# i3-msg reload
