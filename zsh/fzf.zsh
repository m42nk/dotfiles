BASE=$(dirname "$0")

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude node_modules'
export FZF_DEFAULT_OPTS="--bind tab:down,btab:up --layout reverse --cycle"
export FZF_ALT_C_COMMAND='fd --type d --follow --exclude node_modules'
export FZF_COMPLETION_TRIGGER='@'

if [[ -f "${BASE}/etc_profile.d_fzf.zsh" ]]; then
  source ${BASE}/etc_profile.d_fzf.zsh
fi

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --hidden --follow \
    --ignore-file "$HOME/.fzf-cd-ignore" \
    --exclude ".git" \
    . "$1"
}
