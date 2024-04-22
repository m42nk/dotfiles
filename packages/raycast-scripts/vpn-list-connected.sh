#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Connected VPNs:
# @raycast.mode inline
# @raycast.refreshTime 1m

# Optional parameters:
# @raycast.icon 🛜
# @raycast.packageName Developer Util

# Documentation:
# @raycast.description List connected vpns using vpnutil command
# @raycast.author syakhisk
# @raycast.authorURL https://raycast.com/syakhisk

vpnutil list | grep Connected | sed -E "s/[[:space:]]*Connected[[:space:]]*$//" | tr "\n" "," | sed "s/,$/\n/" | sed 's/,/ || /g'

