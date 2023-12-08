#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Kitty Tmux
# @raycast.mode inline
# @raycast.refreshTime 1h

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Developer Utils

# Documentation:
# @raycast.description Kitty that opens tmux
# @raycast.author syakhisk
# @raycast.authorURL https://raycast.com/syakhisk

# /Applications/kitty.app/Contents/MacOS/kitty sh -c "tmux -u a || tmux -u"
osascript -e "\
tell application \"Kitty\"
    windows where name contains \"tmux\"
    if result is not {} then set index of item 1 of result to 1
end tell \
"
