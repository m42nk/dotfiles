# cd to newly created directory
cdn () { cd $(\ls -dt */ | head -n1) }

# Colorized help
help() { "$@" --help 2>&1 | bat --plain --language=help }

# Run a command in the background and disown it
defer(){
  nohup "$@" >/dev/null 2>&1 &; disown
}

# golandd(){
#   defer goland "$@"
# }

# Copy full path to clipboard
cpath(){
  _path="$1"
  echo "Copying path: $(realpath "$_path")"

  _copy() {
    # use pbcopy on mac
    if [[ "$OSTYPE" == "darwin"* ]]; then
      pbcopy
    else
      xclip -selection clipboard
    fi
  }

  realpath "$_path" | _copy
}

# Access cheatsheets from the command line
# usage:
# $ cht tar
cht(){
  cht.sh "$@" | bat
}

# Check if there are suspended jobs and notify when done
# usage:
# $ git clone https://xxx.com/repo.git
# <put command to background, press ctrl-z>
# $ noti
noti(){
  cmd="$(jobs -s)"

  # check if there are suspended jobs
  if [[ -z $cmd ]]; then
    echo "There are no suspended jobs"
    return 1
  fi

  notify() {
    if which notify-send >/dev/null 2>&1; then
      notify-send "Command: $cmd" "Job Done"
      return
    fi

    if which terminal-notifier >/dev/null 2>&1; then
      terminal-notifier -message "Command: $cmd" -title "Job Done" -sound default
      return
    fi

    echo "Job done"
  }

  fg && notify
}

# Commit and push to git, used in dotfiles but can be extended
# usage:
# $ cd ~/Dotfiles
# $ update
update(){
  ALLOWED_DIRS=(
    "$HOME/Dotfiles"
    "$HOME/.config"
  )

  # For loop to check if pwd starts with update_dirs
  # if no, confirm before continuing
  for dir in "${ALLOWED_DIRS[@]}"; do
    if [[ "$PWD" == "$dir"* ]]; then
      continue 2
    fi

    echo "Current directory is not in allowed dirs"
    read "?Continue? [Y/n] "

    if [[ $REPLY =~ [Nn]$ ]]; then
      return 1
    fi
  done

  git add -A
  git status -s

  read "?Continue? [Y/n] "
  if [[ $REPLY =~ [Nn]$ ]]; then
    return 1
  fi

  git commit -m "update"
  git push
}


# Capture the output of a command so it can be retrieved with ret
_cap () { tee /tmp/capture.out; }

# Return the output of the most recent command that was captured by cap
_ret () { cat /tmp/capture.out; }


kubecomplete(){
  source <(kubectl completion zsh)
}

ips(){
  ifconfig | awk '
      /^[a-zA-Z0-9]+:/ {
          if (interface != "" && ipv4 != "") {
              print interface ": " ipv4
          }
          interface=$1
          sub(/:$/, "", interface)
          ipv4=""
      }
      /inet / {
          ipv4=$2
      }
      END {
          if (interface != "" && ipv4 != "") {
              print interface ": " ipv4
          }
      }
  '
}

# Open vim with the given file and line
vimline(){
  filename=$(awk -F ':' '{print $1}' <<< "$1")
  line=$(awk -F ':' '{print $2}' <<< "$1")
  nvim +$line $filename
}

# wtf(){
#   export WTF_JIRA_API_KEY=$(security find-generic-password -l jira-cli -w)
#   wtfutil
# }

starship_kube_disable(){
  unset STARSHIP_KUBE_ENABLED
}

jira-issue-key(){
  url=$1
  if [[ -z $url ]]; then
    echo "No input found"
    return 1
  fi

  issue_key=$(echo $url | sed -E "s|^.*[/=]([A-Za-z]{2,}-[0-9]+)$|\1|")
  if [[ -n $issue_key ]]; then
    echo "$issue_key" | pbcopy
    echo "$issue_key"
  else
    echo "No issue key found in URL: $url"
  fi
}

ls-modified-files(){
  git status -s | sed -E "s/^[[:space:]]//" | awk '{print $2}'
}

py-envinit(){
  env_dir=${1:-./.env}
  python -m venv $env_dir
  echo "env created at: $env_dir"
}

py-activate() {
  env_dir=${1:-./.env}
  echo "activating python env: $env_dir"

  source $env_dir/bin/activate
}

# Escapes quotes in a string, useful for strings that contains quotes
# e.g.
# $ echo 'hello "world"' | escape-quotes -> hello \"world\"
# $ echo "hello 'world'" | escape-quotes -> hello \'world\'
# or
# $ escape-quotes
# # paste / type input
# # press ctrl-d
escape-quotes() {
  quote_char="${1:-\"}"
  cat | sed -E "s/\\$quote_char/\\\\$quote_char/g"
}
