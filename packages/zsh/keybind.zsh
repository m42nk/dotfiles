# Use bash text-object, used in jumping to word, deleting word, etc
autoload -U select-word-style
select-word-style bash

# Use emacs key bindings (ctrl-a, ctrl-e, etc) in zsh
bindkey -e

bindkey "^@" _expand_alias             # <C-Space>
bindkey -M viins "^@" _expand_alias    # <C-Space>
bindkey -M vicmd "^@" _expand_alias    # <C-Space>

bindkey "\e[3~" delete-char            # <Delete>

# Enable to edit current command in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line        # <C-x>e
bindkey '^x^e' edit-command-line       # <C-x><C-e>

# Emacs style
bindkey '^[[1;5C' emacs-forward-word   # <C-RightArrow>
bindkey '^[[1;5D' emacs-backward-word  # <C-LeftArrow>
bindkey '\ef' emacs-forward-word       # <M-f>
bindkey '\eb' emacs-backward-word      # <M-b>
