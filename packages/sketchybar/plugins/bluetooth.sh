#!/bin/sh

# Define colors
COLOR_BLUE=0xff89b4fa # you can change this to your preferred blue
COLOR_WHITE=0xffffffff

# Fetch the name of the currently connected Bluetooth device
bluetooth_device=$(system_profiler -json SPBluetoothDataType | jq -r '.SPBluetoothDataType[0].device_connected[0] | keys | .[0]')

if [ -z "$bluetooth_device" ]; then
  ICON=󰂲
  sketchybar --set "$NAME" icon="$ICON" label="" icon.color=$COLOR_WHITE
  exit 0
fi

ICON=󰂯
sketchybar --set "$NAME" icon="$ICON" label="$bluetooth_device" icon.color=$COLOR_BLUE label.color=$COLOR_BLUE
