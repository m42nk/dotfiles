#!/bin/env zsh

if [[ "$(tty)" = "/dev/tty1" ]]; then
	exec dbus-launch startx > ~/.xorg.log 2>&1
fi

echo ""
[ $(command -v pfetch) ] && pfetch
