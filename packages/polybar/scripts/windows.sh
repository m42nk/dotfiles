#!/bin/env bash

add_leading_zeros() {
  cat | sed -e 's/../0&/2'
}

ACTIVE_WINDOW=$(xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f5 | add_leading_zeros) 
CURRENT_DESKTOP=$(xdotool get_desktop)
COLOR="a2d1ec"
ACTIVE_WINDOW_PREFIX="%{F#$COLOR}%{+u}%{u#$COLOR}"
ACTIVE_WINDOW_SUFFIX="%{-u}%{F-}"

OUTPUT=""

while read -r WIN_INFO; do
	WIN_ID=$(echo "$WIN_INFO" | awk '{print $1}')
	WIN_TITLE=$(echo "$WIN_INFO" | awk '{print $4}' | cut -d'.' -f2 | awk '{print tolower($0)}')
	ACTIVATE_WINDOW_CMD="wmctrl -ia $WIN_ID & disown"

	if [[ "$WIN_ID" == "$ACTIVE_WINDOW" ]]; then
	  OUTPUT+="%{A1: $ACTIVATE_WINDOW_CMD:}"
		OUTPUT+="$ACTIVE_WINDOW_PREFIX"
		OUTPUT+="$WIN_TITLE"
		OUTPUT+="$ACTIVE_WINDOW_SUFFIX"
	  OUTPUT+="%{A}"
	else
	  OUTPUT+="%{A1: $ACTIVATE_WINDOW_CMD:}"
		OUTPUT+="$WIN_TITLE"
	  OUTPUT+="%{A}"
	fi

	OUTPUT+=" "
done < <(wmctrl -lxp | awk -v currentDesktop="$CURRENT_DESKTOP" '$2 == currentDesktop')

echo "$OUTPUT"
