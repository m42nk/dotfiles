#####################################
## Zsh completion settings
##
## Sets options and settings for zsh completion
##
## https://thevaluable.dev/zsh-completion-guide-examples/
## https://zsh.sourceforge.io/Doc/Release/Completion-System.html
#####################################

## Load custom completion
fpath+=("$ZSH/completions")
if command -v brew &> /dev/null; then
  # NOTE: `brew --prefix` can be used, but it's #slow
  fpath+=(/opt/homebrew/share/zsh/site-functions)
fi

## Completion Engine
autoload -Uz compinit
zmodload zsh/complist

## Start the completion engine and cache completion setting
## every 24 hours
DUMPFILE="$XDG_DATA_HOME/zsh/zcompdump"

# TODO: not working, dumpfile is not created
## Requires setopt extended_glob
if [[ -n ${DUMPFILE}(#qN.mh+24) ]]; then
    compinit -d "$DUMPFILE"
else
    compinit -C -d "$DUMPFILE"
fi

# compinit -d "$DUMPFILE"

# _expand # expand env var, if turned on this will expand env var instead of completing it
# _expand_alias # expand alias on tab, if turned on this will expand alias instead of completing it
# _extensions # complete extensions when typing *.
# zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' completer _complete _approximate

# Formatting and verbosity
zstyle ':completion:*' verbose yes # Verbose completion
zstyle ':completion:*' format 'Completing [%d]'
zstyle ':completion:*' auto-description 'specify: %d'

## Cache completion result (useful for apt, dnf, or pacman)
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

## Ignore case in matches, try to complete from any parts of text
## eg. file: _ABC123; if you type 123<tab> it will try to match that too
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'

## Don't autocomplete host names
zstyle ':completion:*' hosts off

# Custom sort order for file ops
zstyle ':completion:*' file-sort modification

## Group matches
# This will make group show at the top of the list and result at the bottom
zstyle ':completion:*' group-name ''

## Colorize ls
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## Completion menu
## Use select menu if there's more than 2 match
zstyle '*:completion:*' menu select=2
