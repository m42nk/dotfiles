autoload -U select-word-style
select-word-style bash

bindkey -e
bindkey "^@" _expand_alias

# TODO:v2: history-substring-search-up requires plugin
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down
# bindkey -M emacs '^P' history-substring-search-up
# bindkey -M emacs '^N' history-substring-search-down

# NOTE: already set in fzf config
# bindkey -s '^T' '^ufzf-fd-preview^M'
# bindkey '\ec' fzf-cd-widget
# bindkey '^R' fzf-history-widget

bindkey "\e[3~" delete-char
bindkey '^X' create_completion

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# Emacs style
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word

bindkey '\ef' emacs-forward-word
bindkey '\eb' emacs-backward-word
