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

# alias -g @@="$HOME/todo"
hash -d t="$HOME/todo"

## Overwrite existing command
##  to use actual command without alias
##  prefix it with backslash (\)
##  eg. \ls, \rm -rf

# alias rm="trash"       # Put to trash instead of remove
alias ls="exa --icons --group-directories-first" # Pretty ls
alias sl="ls" # Pretty ls
alias lsnew="exa -1snew" # Ls sort by newest (bottom -> top)
alias mv="mv -iv"      # Verbose + safer move
alias cp="cp -iv"      # Verbose + safer cp
alias vim="nvim"
alias v="nvim"
alias cat="bat"
alias cdp="cd -P" # Follow symlink

## Program specific alias

## -- Git
alias cdg="cd \`git rev-parse --show-toplevel\`" # Cd to git root
# alias lg="nvim -c '0G'" # Vim fugitive
alias lg="lazygit" # Vim fugitive
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gd="git diff"
alias gp="git push"
alias gaa="git add -A"
alias gsw="git switch"
alias gst="git stash"
alias gpf="git push --force"
alias gco="git checkout"
alias gcl="git clone"
alias gba="git branch -a"
alias gss="git status -s"
alias grv="git remote --verbose"
alias gcan="git commit --amend --no-edit"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias glogn="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative -n 5"
alias gloga="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --all"
alias gpsup='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gcmsg="git commit -m"
alias grw="gh repo view --web"
alias gpl='git pull $(git remote) $(git branch --show-current)'
alias gpll='git pull $(git remote) $(git branch --show-current) || git pull $(git remote) $(git branch --show-current)'
alias gbro='gh browse --branch $(git branch --show-current)'
alias gs="gss"
alias gcb="git branch --show-current"

alias gpr="gh pr view"
alias gprw="gh pr view --web"

## -- Node
alias nrd="npm run dev"
alias nr="npm run"

## -- Docker
alias deit="docker exec -it"
alias dwpb="docker compose run --rm cli bash"
alias dwp="docker compose run --rm cli"
alias dcud="docker compose up -d"
alias dcu="docker compose up"
alias dcd="docker compose down"
alias dps="docker ps --format '{{.ID}}\t{{.Image}}\t{{.Names}}' | column --table"

## -- Tmux
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

## -- Elixir
alias imx="iex -S mix"


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

alias exi="exit"
alias chal="$EDITOR $0 && echo 'Reloading zsh' && exec zsh"
alias chkb="$EDITOR ~/.config/sxhkd/sxhkdrc"

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

alias fr="fzf-rg-preview"
alias ff="fzf-fd-preview"
alias tun="~/Work/scripts/bastion.sh"
# alias mobile='qrencode -t ansiutf8 http://$(ipconfig getifaddr en0):3000'
alias mobile3000='qrencode -t ansiutf8 http://$(ip -4 addr | grep eth0 | grep -oP "(?<=inet\s)\d+(\.\d+){3}"):3000'
alias mobile5173='qrencode -t ansiutf8 http://$(ip -4 addr | grep eth0 | grep -oP "(?<=inet\s)\d+(\.\d+){3}"):5173'
alias asd='ip -4 addr | grep eth0 | grep -oP "(?<=inet\s)\d+(\.\d+){3}"'


alias ieobak="bash $HOME/Codes/IEO-2023/Backups/scripts/cron_db_backup.sh"
alias vite="npm init vite@latest"

# alias sstart="sudo service apache2 start"
# alias sstop="sudo service apache2 stop"
# alias sreload="sudo service apache2 reload"

alias a2start="sudo service apache2 start"
alias a2stop="sudo service apache2 stop"
alias a2reload="sudo service apache2 reload"
alias a2restart="sudo service apache2 restart"

alias pn=pnpm
alias pnf="pnpm --filter"

alias ttd='tt -t 15 -csv >> ~/wpm.csv'

alias itsvpn-downloadonly="node ~/Codes/myits-vpn-download-script/index.js"
alias itsvpn="cd ~/VPNs && node ~/Codes/myits-vpn-download-script/index.js && unzip -o Server2.zip"

gdif(){
  if [ -z "$1" ]; then
    echo "Please provide a filename"
    return
  fi
  converted_filename="$(wslpath "$1")"
  valid_filename="$(wslpath "$1" | sed 's/[^a-zA-Z0-9]/_/g')"
  echo "--$valid_filename | $converted_filename--"
  git diff "$converted_filename" | tee $HOME/Work/vsms/SYNC-DIFF/$valid_filename.diff
}

alias t="todoist"

alias vbox="virtualbox"

alias arduino="arduino-cli"

function getrev(){
  echo "$(git remote get-url origin)/blob/$(git rev-parse HEAD)/$(git rev-parse --show-prefix)$1"
}

alias dns="bash $HOME/VPNs/add-dns.sh"

cpath(){
  _path="$1"
  echo "Copying path: $(realpath "$_path")"
  realpath "$_path" | xclip -selection clipboard
}


alias rmgpucache="rm -r $HOME/.config/google-chrome/Default/GPUCache/"
cht(){
  cht.sh "$@" | bat
}
