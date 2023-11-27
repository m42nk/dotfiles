# if [[ "$(hostname)" == "OMG-154" ]]; then
#   [[ -z "$TMUX" ]] && tmux new -A || true
# fi

# check if mac
if [[ "$(uname)" == "Darwin" ]]; then
  notify-send(){
    osascript -e "display notification \"$1\" with title \"$2\""
  }
fi
