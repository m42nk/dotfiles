# XDG Standards
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="$HOME/.xdg"

# Theming
# export QT_QPA_PLATFORMTHEME="qt5ct"
# export QT_SELECT=5
# export GTK_RC_FILES="$XDG_CONFIG_HOME/gtkrc-1.0/gtkrc"
# export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtkrc-2.0/gtkrc"

# export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
# export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export WINIT_X11_SCALE_FACTOR=1
export LESSHISTFILE=-

# Custom Vars
export DOTFILES="$HOME/Dotfiles"
export CODESDIR="$HOME/Codes"
export DOTS="$DOTFILES"
export EDITOR="lvim"
export TERMINAL="kitty"
# export BROWSER="firefox"
# export BROWSER="google-chrome-stable"
export PAGER="less --mouse"

export PATH="$HOME/.bin/:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/bin:$PATH"
export PATH="$HOME/.yarn/bin/:$PATH"
export PATH="$HOME/.asdf/installs/nodejs/lts/.npm/bin:$PATH"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export PATH="$HOME/.local/share/applications/DataGrip-2021.2.4/bin/:$PATH"
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

export BM="$HOME/Bookmarks"

# export PATH="$HOME/.local/share/applications/DataGrip-2021.3.1/bin/:$PATH"

# Colored man page
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'

# pfetch
export PF_INFO="ascii title os wm editor kernel uptime"
export PF_ASCII="arch"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude node_modules'
export FZF_DEFAULT_OPTS="--bind tab:down,btab:up --layout reverse --cycle"
export FZF_ALT_C_COMMAND='fd --type d --follow --exclude node_modules'
export FZF_COMPLETION_TRIGGER='@'

export VSCODE_GALLERY_SERVICE_URL='https://marketplace.visualstudio.com/_apis/public/gallery'
export VSCODE_GALLERY_CACHE_URL='https://vscode.blob.core.windows.net/gallery/index'
export VSCODE_GALLERY_ITEM_URL='https://marketplace.visualstudio.com/items'
export VSCODE_GALLERY_CONTROL_URL=''
export VSCODE_GALLERY_RECOMMENDATIONS_URL=''

export ANDROID_SDK="$HOME/Android/Sdk"
export PATH="$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$PATH"

local COMPOSER_BIN="$HOME/.asdf/installs/php/8.1.3/.composer/vendor/bin"
if [[ -d "$COMPOSER_BIN" ]]; then
  export PATH="$COMPOSER_BIN:$PATH"
fi

# zsh exports
# export HISTFILESIZE=1000000000
# export HISTSIZE=1000000000

# # Function
# function fallback(){
#   for cmd in "$@"; do
#     command -v "$cmd" > /dev/null && echo "$cmd" && break
#   done
# }
