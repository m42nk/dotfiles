#!/bin/env zsh

# capture the output of a command so it can be retrieved with ret
_cap () { tee /tmp/capture.out; }

# return the output of the most recent command that was captured by cap
_ret () { cat /tmp/capture.out; }

# cd to newly created directory
function cdn() {
	cd $(\ls -dt */ | head -n1)
}

function async() {
	"$1"&;disown
}

function gi() {
	curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@
}

function cpcmd() {
	fc -ln | fzf | xclip -sel clip
}

function cam() {
	DEV="/dev/video0"
	if [ -n "$1" ]; then
		[ -f "$1" ] && DEV="$1" || echo "$1 does not exist" && return 1
	fi

	echo "Starting webcam with $DEV"

	mpv -vf=hflip av://v4l2:$DEV --profile=low-latency --untimed >/tmp/mpv-out 2>&1 &
	disown
}

#mkdir then cd
function mkcd() {
	mkdir -p -- "$1" && cd -P -- "$1"
}
