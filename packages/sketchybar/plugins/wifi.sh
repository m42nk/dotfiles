#!/bin/sh

# Get the current Wi-Fi SSID
SSID=$(networksetup -getairportnetwork en0 | awk -F': ' '{print $2}')

if [ -z "$SSID" ]; then
  ICON=󰖪
  sketchybar --set "$NAME" icon="$ICON" label=""
  exit 0
fi

ICON=
sketchybar --set "$NAME" icon="$ICON" label="$SSID"
