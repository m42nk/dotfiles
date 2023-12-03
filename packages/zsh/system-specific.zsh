# if [[ "$(hostname)" == "OMG-154" ]]; then
#   [[ -z "$TMUX" ]] && tmux new -A || true
# fi

# check if mac
if [[ "$(uname)" == "Darwin" ]]; then
  notify-send(){
    terminal-notifier -message "$1" -title "$2"
  }
fi
