alias vim="$EDITOR"
alias v="$EDITOR"
# alias code="vscodium"

# alias -g ..="cd .."
# alias -g ...="cd ../.."
# alias -g ....="cd ../../.."
# alias -g .....="cd ../../../.."

alias -g ..=".."
alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."

alias e="code -r"

alias x="chmod +x"
alias p="ping 8.8.8.8"
alias l="ls -lab"
alias d="dots"
alias s="sudo "

alias se="sudoedit"
alias mv="mv -iv"
alias bc="bc -ql"
alias cp="cp -iv"

alias vi="$EDITOR"
alias	ka="killall"
alias ez="exec $SHELL"
alias ld="lazydocker"
alias lg="lazygit"
alias ll="ls -lb"
alias ls="exa --icons"
alias nh="sudo nethogs"
alias py="python"
# alias rm="echo 'Use trash-put instead' && return"
alias rm="trash"
alias tk="taskell"
alias vz='$EDITOR `fzf`'
alias tp="trash-put"

alias btw="sudo efibootmgr -n 0 && reboot"
alias mkd="mkdir -pv"

alias cd-='cd `git rev-parse --show-toplevel`'
alias cdf='cd `fd --max-depth 3 --type d | fzf`'
alias cdot="cd $DOTFILES"
alias cdots="cd $DOTFILES"

alias ctmp="mkdir -p /tmp/scratch && cd /tmp/scratch"
alias tmp="mkdir -p /tmp/scratch && $EDITOR /tmp/scratch/tmp"

alias chal="$EDITOR $0 && echo 'Reloading zsh' && exec zsh"
alias chkb="$EDITOR $HOME/.config/sxhkd/sxhkdrc && echo 'Reloading sxhkd'; killall -SIGUSR1 sxhkd"
alias zrc="$EDITOR $HOME/.config/zsh/zshrc"

alias art="find-artisan"

alias yst="yarn start"
alias yrdd="yarn develop"
alias yrd="yarn dev"
alias yrb="yarn build"

alias ni="npm install"
alias nr="npm run"
alias nrd="npm run dev"
alias nrdd="npm run develop"
alias nrw="npm run watch"
alias nst="npm start"

alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gp="git push"
alias gpf="git push --force"
alias gco="git checkout"
alias gba="git branch -a"
alias gss="git status -s"
alias gcan="git commit --amend --no-edit"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gloga="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --all"
alias gpsup='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gcmsg="git commit -m"

alias dwpb="docker-compose run --rm cli bash"
alias dwp="docker-compose run --rm cli"
alias deit="docker exec -it"
alias dcud="docker-compose up -d"
alias dcu="docker-compose up"
alias dcd="docker-compose down"

alias t="tmux"
alias tls='tmux list-session'
alias tks='tmux kill-server'
alias tcl='tmux-clean'
alias tfs="tmux-focus-session"
alias tfc="tmux-focus-session CODE"
alias mux="tmuxinator"
alias tren="tmux rename-window"
function tmv(){
  [[ "$1" == "l" ]] && tmux swap-window -t -1 \; select-window -t -1
  [[ "$1" == "r" ]] && tmux swap-window -t +1 \; select-window -t +1
  [[ $1 =~ '^[0-9]+$' ]] && tmux swap-window -t $1 \; select-window -t $1
}

alias pacman="sudo pacman"
alias pins="sudo pacman -S"
alias pup="sudo pacman -Sy"
alias prem="sudo pacman -R"

alias clip="xclip -sel clip"
alias clock="tty-clock -B -c"
alias fix="stty sane"
alias fzc='cd `fzf-codes`'
alias icat="kitty +kitten icat"
alias lgd="pushd $DOTFILES; lazygit; popd"
alias lsnew="exa -1snew"
alias msql="mitzasql"
alias pbar="bash ~/.config/polybar/launch.sh"
alias publicip="curl icanhazip.com"
alias sxp="source $HOME/.xprofile"
alias tclock="kitty -- tty-clock -B -c"
alias eos-mnt="sudo mount /dev/sdb7 /mnt"
alias eos-cd="cd /mnt/home/m42nk"
alias eos-umnt="sudo umount /mnt"
alias props="xprop WM_CLASS WM_NAME"
alias info="info --vi-keys"

alias thunar="thunar &; disown"

alias unhackermode="bebasid hosts remove"
alias hackermode="bebasid hosts install"

# Verbosity and settings that you pretty much just always are going to want.
if [[ "$ENABLE_CORRECTION" == "true" ]]; then
  alias mv='nocorrect mv -iv'
  alias cp='nocorrect cp -iv'
  alias mkdir='nocorrect mkdir'
  alias sudo='nocorrect sudo'
  alias heroku='nocorrect heroku'
  alias man='nocorrect man'

  setopt correct_all
fi

alias start="sudo systemctl start"
alias status="sudo systemctl status"
alias stop="sudo systemctl stop"

# always sudo
# cmd=(mount)
alias mount="sudo mount"

# sane defaults
alias disk="sudo df -h -x tmpfs"

alias activate="source venv/bin/activate"
alias acti="source venv/bin/activate"
alias acti!="deactivate"

# alias wifi="iwctl station wlan0"
alias waitfi="while ! ping -c 1 google.com; do sleep 0.5; done"
alias wf="while ! ping -c 1 google.com; do sleep 0.5; done"
alias wifi-qr="nmcli device wifi show-password"

alias dfx="df -x tmpfs -h"
alias sqlpad_init="docker run --name sqlpad -p 9999:3000 --volume ~/SQLPad/data:/var/lib/sqlpad --detach sqlpad/sqlpad:latest"
alias sqlpad="docker"

alias ccw='cd $(code-current-workspace || echo ".")'

if [[ $(tmux has 2>/dev/null) ]] && [[ $(tmux display-message -p '#S') = "CODE" ]]; then
  alias edit="code -r"
  alias e="code -r"
  alias vim="code -r"
  alias lg='lazygit --use-config-file="$XDG_CONFIG_HOME/lazygit/config.yml,$XDG_CONFIG_HOME/lazygit/config-code.yml"'
fi

alias sysctl="sudo systemctl"
alias suded="sudoedit"
alias se="sudoedit"

alias rgconf="rg --follow --ignore-case --iglob='!google-chrome' --iglob='!discord' --iglob='!Code' --iglob='!obs-studio'"

# alias codemin="code --extensions-dir ~/vscode_profiles/minimal/exts --user-data-dir ~/vscode_profiles/minimal/data"
