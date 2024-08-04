#!/usr/bin/env bash

SPACE=${1}

# Function to get key code for a number
get_key_code() {
	case $1 in
	1) echo 18 ;;
	2) echo 19 ;;
	3) echo 20 ;;
	4) echo 21 ;;
	5) echo 23 ;;
	6) echo 22 ;;
	7) echo 26 ;;
	8) echo 28 ;;
	9) echo 25 ;;
	*) echo "Invalid number. Please enter a number between 1 and 9." ;;
	esac
}

# Check if a number was provided as an argument
if [ -z "$1" ]; then
	echo "Usage: $0 <number>"
	exit 1
fi

key_code=$(get_key_code "${SPACE}")

osascript <<END
tell application "System Events"
  key code ${key_code} using {control down, command down}
end tell
END
