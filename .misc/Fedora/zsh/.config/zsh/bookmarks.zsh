# bookmarks
BMDIR="$HOME/Bookmarks"

[[ ! -d "$BMDIR" ]] && return

export CDPATH=".:$BMDIR"
# alias @="$BMDIR"

# Change dir hooks
function chpwd() {
	emulate -L zsh
	# check if the directory starts with @
	[[ "$PWD" =~ "^$BMDIR/@.*" ]] && cd -P "${PWD}"
}

function bm-add() {
	local dir="${2:-$PWD}"

	[[ "$2" = "." ]] && dir="$PWD"
	[[ "$2" = ".." ]] && dir="$PWD/.."

	local name="${1:-$(basename "$dir")}"

	# check if name starts with @
	if [[ ! "$name" =~ "^@.*" ]]; then
		name="@$1"
	fi

	ln -s "$dir" "$BMDIR/$name"
}

function bm-rm() {
	local name="${1:-$(basename "$dir")}"

	# check if name starts with @
	if [[ "$name" =~ "^@.*" ]]; then
		name="${name:1}"
	else
		name="@$name"
	fi

	if [[ -L "$BMDIR/$name" ]]; then
		\rm "$BMDIR/$name"
	else
		echo "No bookmark found for $name"
	fi
}

function bm-ls() {
	find -P $BMDIR -maxdepth 1 -type l -exec basename -z {} \; -exec echo -n " -> " \; -exec readlink {} \;
}

function bm() {
	case "$1" in
	-a|a)
		shift
		bm-add "$@"
		bm-ls "$@"
		;;
	-r|r)
		shift
		bm-rm "$@"
		bm-ls "$@"
		;;
	-l|l)
		shift
		bm-ls "$@"
		;;
	*)
		echo "Usage: bm [(a)dd|(r)m|(l)s]"
		bm-ls "$@"
		;;
	esac
}
