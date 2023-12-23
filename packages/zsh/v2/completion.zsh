#####################################
## Zsh completion settings
##
## Sets options and settings for zsh completion
##
## https://thevaluable.dev/zsh-completion-guide-examples/
## https://zsh.sourceforge.io/Doc/Release/Completion-System.html
#####################################

## Load custom completion
## TODO: migrate to new version
fpath+=("$ZSH/completions")

## Completion Engine
autoload -Uz compinit

## Start the completion engine and cache completion setting
compinit -d $XDG_DATA_HOME/zsh/zcompdump

# # _expand # expand env var, if turned on this will expand env var instead of completing it
# # _expand_alias # expand alias on tab, if turned on this will expand alias instead of completing it
# # _extensions # complete extensions when typing *.
# zstyle ':completion:*' completer _expand _complete _correct _approximate

# Formatting and verbosity
zstyle ':completion:*' verbose yes # Verbose completion
zstyle ':completion:*' format 'Completing [%d]'
zstyle ':completion:*' auto-description 'specify: %d'

## Cache completion result (useful for apt, dnf, or pacman)
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

# ## Ignore case in matches, try to complete from any parts of text
# ## eg. file: _ABC123; if you type 123<tab> it will try to match that too
# # zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# # zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

## Don't autocomplete host names
zstyle ':completion:*' hosts off

# # Custom sort order for file ops
# zstyle ':completion:*:*:cp:*' file-sort modification
# zstyle ':completion:*:*:mv:*' file-sort modification
# zstyle ':completion:*:*:rm:*' file-sort modification

## Group matches
zstyle ':completion:*' group-name ''

## Colorize ls
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## Completion menu
## Use select menu if there's more than 2 match
zstyle '*:completion:*' menu select=2
