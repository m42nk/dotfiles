#!/bin/env zsh

# [[ -f "/etc/profile.d/fzf.zsh" ]] && source /etc/profile.d/fzf.zsh

BASE=$(dirname "$0")
[[ -f "${BASE}/etc_profile.d_fzf.zsh" ]] && source ${BASE}/etc_profile.d_fzf.zsh

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --hidden --follow \
    --ignore-file "$HOME/.fzf-cd-ignore" \
    --exclude ".git" \
    . "$1"
}

