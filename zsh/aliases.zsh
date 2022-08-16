#################################
##
## Aliases
##
## - bcs no one likes to type
#################################

## Global alias (-b)
## will be expanded even if not typed in at the start

alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."

## Overwrite existing command
##  to use actual command without alias
##  prefix it with backslash (\)
##  eg. \ls, \rm -rf

alias rm="trash"       # Put to trash instead of remove
alias ls="exa --icons" # Pretty ls
alias lsnew="exa -1snew" # Ls sort by newest (bottom -> top)
alias mv="mv -iv"      # Verbose + safer move
alias cp="cp -iv"      # Verbose + safer cp

## Program specific alias

## -- Git
alias cdg="cd \`git rev-parse --show-toplevel\`" # Cd to git root
alias lg="nvim -c '0G'" # Vim fugitive
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gp="git push"
alias gpf="git push --force"
alias gco="git checkout"
alias gba="git branch -a"
alias gss="git status -s"
alias grv="git remote --verbose"
alias gcan="git commit --amend --no-edit"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gloga="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --all"
alias gpsup='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gcmsg="git commit -m"

## -- Docker
alias deit="docker exec -it"
alias dwpb="docker-compose run --rm cli bash"
alias dwp="docker-compose run --rm cli"
alias dcud="docker-compose up -d"
alias dcu="docker-compose up"
alias dcd="docker-compose down"

## -- Tmux
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

## -- Pacman (arch)
alias pacman="sudo pacman"
alias pins="sudo pacman -S"
alias pup="sudo pacman -Sy"
alias prem="sudo pacman -R"

## -- Python venv
alias activate="source venv/bin/activate"
alias acti="source venv/bin/activate"
alias deact="deactivate"

## -- WiFi

alias waitfi="while ! ping -c 1 google.com; do sleep 0.5; done"
alias wf="while ! ping -c 1 google.com; do sleep 0.5; done"
alias wifi-qr="nmcli device wifi show-password"


## one-char
alias d="dots"         # Custom scripts to fzf dotfiles
alias e="code -r"      # Open using existing vscode window
alias g="git"          # Vim fugitive
alias l="ls -lab"      # Why ls when you can l
alias p="ping 8.8.8.8" # Ping!
alias x="chmod +x"     # Add executable permission to file
alias s="sudo "        # Why sudo when you can s

## two-char
alias ez="exec zsh" # Restart zsh
alias py="python"   # pypypypy
alias tk="taskell"  # Todo management

## three-char and more
alias btw="sudo efibootmgr -n 0 && reboot" # Boot to window on next boot
alias mkd="mkdir -pv"                      # Idempotent and verbose mkdir
alias dfx="df -x tmpfs -h"                 # List disk free

## Other

alias chal="$EDITOR $0 && echo 'Reloading zsh' && exec zsh"

## -- Systemctl (linux only)
alias start="sudo systemctl start"
alias status="sudo systemctl status"
alias stop="sudo systemctl stop"

## -- vscode
if [[ $(tmux has 2>/dev/null) ]] && [[ $(tmux display-message -p '#S') = "CODE" ]]; then
  alias edit="code -r"
  alias e="code -r"
  alias vim="code -r"
  alias lg='lazygit --use-config-file="$XDG_CONFIG_HOME/lazygit/config.yml,$XDG_CONFIG_HOME/lazygit/config-code.yml"'
fi


## -- aliasing clear

clear=(
  celar
  ckear
  clae
  claer
  clare
  clea
  cler
  clera
  laer
  lear
  rls
)

for c in "${clear[@]}"; do
  alias $c="clear"
done

unset $clear
