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
    echo "There are suspended jobs"
    return 1
  fi

  fg && notify-send "Command: $cmd" "Job Done"
}

# Commit and push to git, used in dotfiles but can be extended
# usage:
# $ cd ~/Dotfiles
# $ update
update(){
  ALLOWED_DIRS=(
    "$HOME/Dotfiles/"
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

set_gojek_env(){
  export GOPRIVATE="source.golabs.io/*"
  export GONOSUMDB="source.golabs.io/*"
  # export GOPROXY="http://artifactory-gojek.golabs.io/artifactory/go,https://proxy.golang.org,direct"
}

unset_gojek_env(){
  unset GOPRIVATE
  unset GONOSUMDB
  # unset GOPROXY
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

# wtf(){
#   export WTF_JIRA_API_KEY=$(security find-generic-password -l jira-cli -w)
#   wtfutil
# }
