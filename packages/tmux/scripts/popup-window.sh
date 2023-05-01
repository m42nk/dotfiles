#!/usr/bin/env bash

POPUP_SESSION_NAME="scratch"

if [ "$(tmux display-message -p -F "#{session_name}")" = "$POPUP_SESSION_NAME" ];then
    tmux detach-client
else
    tmux popup -E -h '80%' -w '80%' "tmux attach -t $POPUP_SESSION_NAME || tmux new -s $POPUP_SESSION_NAME"
fi
