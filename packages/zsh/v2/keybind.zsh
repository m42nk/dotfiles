autoload -U select-word-style
select-word-style bash

bindkey -e
bindkey "^@" _expand_alias

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
