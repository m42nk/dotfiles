# XDG Standards
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="$HOME/.xdg"

export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export WINIT_X11_SCALE_FACTOR=1
export LESSHISTFILE=-

# Custom Vars
export DOTFILES="$HOME/Dotfiles"
export CODESDIR="$HOME/Codes"
export DOTS="$DOTFILES"
export EDITOR="nvim"
export TERMINAL="kitty"
# export BROWSER="firefox"
# export BROWSER="google-chrome-stable"
export PAGER="less --mouse"

export PATH="$HOME/.bin/:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/bin:$PATH"
# export PATH="$HOME/.yarn/bin/:$PATH"

export BM="$HOME/Bookmarks"

# export PATH="$HOME/.local/share/applications/DataGrip-2021.3.1/bin/:$PATH"
# export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# Colored man page
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'

# pfetch
export PF_INFO="ascii title os wm editor kernel uptime"
# export PF_ASCII="arch"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude node_modules'
export FZF_DEFAULT_OPTS="--bind tab:down,btab:up --layout reverse --cycle"
export FZF_ALT_C_COMMAND='fd --type d --follow --exclude node_modules'
export FZF_COMPLETION_TRIGGER='@'

export VSCODE_GALLERY_SERVICE_URL='https://marketplace.visualstudio.com/_apis/public/gallery'
export VSCODE_GALLERY_CACHE_URL='https://vscode.blob.core.windows.net/gallery/index'
export VSCODE_GALLERY_ITEM_URL='https://marketplace.visualstudio.com/items'
export VSCODE_GALLERY_CONTROL_URL=''
export VSCODE_GALLERY_RECOMMENDATIONS_URL=''

# local COMPOSER_BIN="$HOME/.asdf/installs/php/8.1.3/.composer/vendor/bin"
# if [[ -d "$COMPOSER_BIN" ]]; then
#  export PATH="$COMPOSER_BIN:$PATH"
# fi
# export PATH="$HOME/.asdf/installs/nodejs/lts/.npm/bin:$PATH"
