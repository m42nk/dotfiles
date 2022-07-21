#!/bin/env zsh

# need testing
# #!/bin/env bash

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

function note() {
	if [ $(command -v lvim) ]; then
		lvim -c "e ~/vimwiki/$1.md"
	elif [ $(command -v nvim) ]; then
		nvim -c "e ~/vimwiki/$1.md"
	else
		vim -c "e ~/vimwiki/$1.md"
	fi
}

function za() {
	zathura "$1" >/dev/null 2>&1 &
	disown
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

function countdown() {
	date1=$(($(date +%s) + $1))
	while [ "$date1" -ge $(date +%s) ]; do
		echo -ne "$(date -u --date @$(($date1 - $(date +%s))) +%H:%M:%S)\r"
		sleep 0.1
	done
}

function stopwatch() {
	date1=$(date +%s)
	while true; do
		echo -ne "$(date -u --date @$(($(date +%s) - $date1)) +%H:%M:%S)\r"
		sleep 0.1
	done
}

# # blank aliases
# typeset -a baliases
# baliases=()

# balias() {
#   alias $@
#   args="$@"
#   args=${args%%\=*}
#   baliases+=(${args##* })
# }

# # ignored aliases
# typeset -a ialiases
# ialiases=()

# ialias() {
#   alias $@
#   args="$@"
#   args=${args%%\=*}
#   ialiases+=(${args##* })
# }

# # functionality
# expand-alias-space() {
# [[ $LBUFFER =~ "\<(${(j:|:)baliases})\$" ]]; insertBlank=$?

# if [[ ! $LBUFFER =~ "\<(${(j:|:)ialiases})\$" ]]; then
#   zle _expand_alias
# fi

# zle self-insert

# if [[ "$insertBlank" = "0" ]]; then
#   zle backward-delete-char
# fi

# zle backward-delete-char
# }

# zle -N expand-alias-space

# # for expanding alias on space
# bindkey " " expand-alias-space

# for expanding alias only on ctrl+space
# bindkey "^@" expand-alias-space

# bindkey -M isearch " " magic-space

# howdoi helper show 5 answer
# alias h='function hdi(){ howdoi $* -c -n 5 }; hdi'
# alias hless='function hdi(){ howdoi $* -c -n 10 | less --raw-control-chars --quit-if-one-screen --no-init; }; hdi'
