#!/bin/sh

# Fetch the name of the currently connected Bluetooth device
bluetooth_device=$(system_profiler -json SPBluetoothDataType | jq -r '.SPBluetoothDataType[0].device_connected[0] | keys | .[0]')

if [ -z "$bluetooth_device" ]; then
  ICON=󰂲
  sketchybar --set "$NAME" icon="$ICON" label=""
  exit 0
fi

ICON=󰂯
sketchybar --set "$NAME" icon="$ICON" label="$bluetooth_device"
