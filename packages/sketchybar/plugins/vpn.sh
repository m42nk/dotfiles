#!/bin/sh

CONNECTED_VPN=$(/usr/local/bin/vpnutil list | grep -v Disconnected | sed 's/ Connected/,/')
if [ -z "$CONNECTED_VPN" ]; then
  sketchybar --set "$NAME" label=""
	exit 0
fi

VPN=$(echo "$CONNECTED_VPN" | tr '\n' ' ' | sed 's/, $//' | sed 's/\(.*\)/\[\1\]/')

sketchybar --set "$NAME" label="$VPN"
