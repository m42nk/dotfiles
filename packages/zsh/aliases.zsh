#################################
## Aliases
## - bcs no one likes to type
#################################

## Global alias (-g)
## will be expanded even if not typed in at the start
alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."

## Hash - add another directory to hash
## eg. hash -d t="$HOME/todo" will make ~t expand to $HOME/todo
hash -d t="$HOME/todo"

## Overwrite existing command
##  to use actual command without alias prefix it with backslash (\)
##  eg. \ls, \rm -rf
alias vim="nvim"
alias ls="exa --icons --group-directories-first" # Pretty ls
alias cat="bat"                                  # Pretty cat, syntax highlight, etc
alias mv="mv -iv"                                # Verbose + safer move
alias cp="cp -iv"                                # Verbose + safer cp
alias rm="trash"

## one-char
alias d="dots"         # Custom scripts to fzf dotfiles
# alias e="code -r"      # Open using existing vscode window
alias g="git"          # Vim fugitive
alias l="ls -lab"      # Why ls when you can l
alias p="ping 8.8.8.8" # Ping!
alias x="chmod +x"     # Add executable permission to file
alias s="sudo"         # Why sudo when you can s

## Shorter variant of commands
alias py="python"
alias pn="pnpm"
alias tk="taskell"

alias prof="zprof | bat"                                    # List shell startup execution time
alias perf="hyperfine --warmup 3 'zsh -ic exit'"            # Shell startup time
alias ez="exec zsh"                                         # Restart zsh
alias vbox="virtualbox"                                     # Shorter virtualbox
alias lsnew="exa -1snew"                                    # Ls sort by newest (bottom -> top)
alias cdp="cd -P"                                           # Follow symlink
alias chal="$EDITOR $0 && echo 'Reloading zsh' && exec zsh" # Change alias and reload zsh
alias chkb="$EDITOR ~/.config/sxhkd/sxhkdrc"                # Change keybind and reload sxhkd

## Typo fix
alias exi="exit"
alias sl="ls"    # Make sl same as ls, for those who type too fast
clear=(celar ckear clae claer clare clea cler clera laer lear rls)
for c in $clear; do
  alias $c="clear"
done; unset clear

## Git
alias cdg="cd \`git rev-parse --show-toplevel\`" # Cd to git root
alias ga="git add"
alias gaa="git add -A"
alias gba="git branch -a"
alias gcan="git commit --amend --no-edit"
alias gcmsg="git commit -m"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gloga="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --all"
alias glogn="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative -n 5"
alias gp="git push"
alias gpf="git push --force"
alias gpl='git pull'
alias gpll='git pull $(git remote) $(git branch --show-current)'
alias gpsup='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gs="gss"
alias gss="git status -s"
alias gd="git diff"
alias lg="lazygit"
alias gco="git checkout"
alias grom="git rebase origin/master"

## Docker
alias dcud="docker compose up -d"
alias dcu="docker compose up"
alias dcd="docker compose down"

## Tmux
alias tks='tmux kill-server'
alias tls='tmux list-session'
alias tcl='tmux-clean'

## Node
alias nrd="npm run dev"
alias nr="npm run"

## Pacman (arch)
alias pacman="sudo pacman"
alias pins="sudo pacman -S"
alias prem="sudo pacman -R"

# Random things, rarely used
alias zsh-delete-cache="rm -riv $XDG_DATA_HOME/zsh/zcompdump $XDG_CACHE_HOME/zsh/zcompcache"
alias btw="sudo efibootmgr -n 0 && reboot" # Boot to window on next boot
alias arduino="arduino-cli"
alias waitfi="while ! ping -c 1 google.com; do sleep 0.5; done"
alias wf="while ! ping -c 1 google.com; do sleep 0.5; done"
alias wifi-qr="nmcli device wifi show-password"
alias mkd="mkdir -pv"                      # Idempotent and verbose mkdir
alias dfx="df -x tmpfs -h"                 # List disk free
alias mobile3000='qrencode -t ansiutf8 http://$(ip -4 addr | grep eth0 | grep -oP "(?<=inet\s)\d+(\.\d+){3}"):3000'
alias mobile5173='qrencode -t ansiutf8 http://$(ip -4 addr | grep eth0 | grep -oP "(?<=inet\s)\d+(\.\d+){3}"):5173'
alias asd='ip -4 addr | grep eth0 | grep -oP "(?<=inet\s)\d+(\.\d+){3}"'
alias pnf="pnpm --filter"
alias ttd='tt -t 15 -csv >> ~/wpm.csv'
alias t="todoist"
alias dns="bash $HOME/VPNs/add-dns.sh"
alias itsvpn-downloadonly="node ~/Codes/myits-vpn-download-script/index.js"
alias itsvpn="cd ~/VPNs && node ~/Codes/myits-vpn-download-script/index.js && unzip -o Server2.zip"
alias rmgpucache="rm -r $HOME/.config/google-chrome/Default/GPUCache/"
