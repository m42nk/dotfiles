IS_UBUNTU=$(lsb_release -d | awk -F'\t' '{print $2}' | grep -c "Ubuntu")

if [[ $IS_UBUNTU == 0 ]] && command -v startx && [[ "$(tty)" = "/dev/tty1" ]]; then
	exec dbus-launch startx > ~/.xorg.log 2>&1
fi

echo ""
command pfetch
