## Variables used in plugins (unplugged.zsh)
export ZPLUGINDIR="$XDG_DATA_HOME/zsh/plugins"
export ZSH_CUSTOM="$XDG_DATA_HOME/zsh"

## Plugin installer/helper
# this contains plugin-load and plugin-compile function
src $ZSH/unplugged.zsh

## Plugin definitions
# Plugins defined here if they don't need any config
# if they do, they are defined in $PLUGINS_DIR
plugins=(
  agkozak/zsh-z                          # Jump around directories using z
  Aloxaf/fzf-tab                         # Replace default zsh tab completion with fzf
  zsh-users/zsh-history-substring-search # Make up and down arrow keys search subtring from history
  zsh-users/zsh-completions              # Additional completion definitions
  zsh-users/zsh-syntax-highlighting      # Syntax highlighting, can be #slow, should be loaded at the end of zshrc but idc
  zsh-users/zsh-autosuggestions          # Suggests commands based on history, can be #slow
  # Freed-Wu/fzf-tab-source                # Make fzf-tab completion more informative
  # MichaelAquilina/zsh-auto-notify        # Send notifications when long running command finishes
  # wfxr/forgit
  # jeffreytse/zsh-vi-mode
)

for repo in $plugins; do
  plugin-load https://github.com/${repo}.git
done; unset repo

## Configuration for plugins
if plugin-installed zsh-history-substring-search; then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  bindkey -M emacs '^P' history-substring-search-up
  bindkey -M emacs '^N' history-substring-search-down
fi

if plugin-installed fzf-tab; then
  FZF_TAB_FILE_LIST_CMD='exa --long --no-time --header --group-directories-first --no-user'
  FZF_TAB_FILE_VIEW_CMD='bat --color=always --style=numbers'

  command -v 'exa' >/dev/null || FZF_TAB_FILE_LIST_CMD='ls'
  command -v 'bat' >/dev/null || FZF_TAB_FILE_VIEW_CMD='cat'

  zstyle ':fzf-tab:*' switch-group ',' '.'
  zstyle ':fzf-tab:*' fzf-bindings 'ctrl-/:toggle-preview'
  # zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

  zstyle ':fzf-tab:complete:cd:*' fzf-preview "$FZF_TAB_FILE_LIST_CMD \$realpath"
  zstyle ':fzf-tab:complete:exa:*' fzf-preview "[[ -f \$realpath ]] && $FZF_TAB_FILE_VIEW_CMD \$realpath || $FZF_TAB_FILE_LIST_CMD \$realpath"
  zstyle ':fzf-tab:complete:ls:*' fzf-preview "[[ -f \$realpath ]] && $FZF_TAB_FILE_VIEW_CMD \$realpath || $FZF_TAB_FILE_LIST_CMD \$realpath"

  # Make sure to set this zstyle if you want zstyle file-sort to be working
  zstyle ':completion:complete:*:argument-rest' sort false
fi
