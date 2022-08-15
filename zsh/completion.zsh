#####################################
## Zsh completion settings
##
## Sets options and settings for zsh completion
##
## https://thevaluable.dev/zsh-completion-guide-examples/
## https://zsh.sourceforge.io/Doc/Release/Completion-System.html
#####################################

## Completion Engine
autoload -Uz compinit

## Cache completion setting
compinit -d $XDG_DATA_HOME/zcompdump

## Load custom completion
fpath+=("$ZSH/completions")

# _expand # expand env var
# _expand_alias # expand alias on tab
# _extensions # complete extensions when typing *.
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing [%d]'

# Cache completion result (useful for apt, dnf, or pacman)
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# Make lowercase match uppercase also, but uppercase won't match lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

zstyle ':completion:*' verbose true # Verbose completion
zstyle ':completion:*' hosts off            # Don't autocomplete host names
zstyle ':completion:*' auto-description 'specify: %d'

# Completion menu
# zstyle ':completion:*:*:*:*:*' menu select=2 interactive
zstyle '*:completion:*' menu select=2

