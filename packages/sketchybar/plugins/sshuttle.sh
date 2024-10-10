#!/bin/sh

IS_RUNNING=$(pgrep -q -u root -f "Python /opt/homebrew/bin/sshuttle" && echo 0 || echo 1)

if [ "$IS_RUNNING" -gt 0 ]; then
  sketchybar --set "$NAME" label=""
  exit 0
fi

LABEL="󰒃 SSHUTTLE"
sketchybar --set "$NAME" label="$LABEL"
