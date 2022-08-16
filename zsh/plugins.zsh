ZPLUGINDIR="$XDG_DATA_HOME/zsh/plugins"

src $ZSH/unplugged.zsh

plugins=(
  zdharma-continuum/fast-syntax-highlighting
  Aloxaf/fzf-tab
  agkozak/zsh-z
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-completions
  tom-doerr/zsh_codex
  # wfxr/forgit
  # jeffreytse/zsh-vi-mode
)

for repo in $plugins; do
  plugin-load https://github.com/${repo}.git
done

unset repo
