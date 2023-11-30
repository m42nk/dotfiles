# if [[ "$(hostname)" == "OMG-154" ]]; then
#   [[ -z "$TMUX" ]] && tmux new -A || true
# fi

# check if mac
if [[ "$(uname)" == "Darwin" ]]; then
  notify-send(){
    terminal-notifier -message "$1" -title "$2"
  }
fi

if [[ "$(uname)" == "Darwin" ]] && [[ "$(hostname)" == "Syakhisk-Alazmi.local" ]]; then
  export GOPRIVATE="source.golabs.io/*"
  export GONOSUMDB="source.golabs.io/*"
  export GOPROXY="http://artifactory-gojek.golabs.io/artifactory/go,https://proxy.golang.org,direct"
fi
