preexec(){
  case "$1" in
    nrd|"npm run dev"|"npm run serve"|yrd|"yarn dev"|"yarn serve"|"pn dev"|"pn serve"|"air")
      echo "::Rename tmux Server::"
      tmux rename-window "Server"
      ;;
    "npm run serve"|"yarn serve")
      echo "::Rename tmux Server::"
      tmux rename-window "Server"
      ;;
    *)
      ;;
  esac
}

# ___rename-tmux-session-on-dirs() {
#   emulate -L zsh
#
#   case "$PWD" in
#     ("$HOME/Work"*)
#       [ -n "$TMUX" ] && tmux rename-session "Work"
#       ;;
#     (*)
#       ;;
#   esac
#
#
#   # ("$HOME/Work"*|"$HOME/Codes")
#   #   echo "::Rename tmux Session::"
#   #   ;;
#
# }
#
# add-zsh-hook chpwd ___rename-tmux-session-on-dirs

__track-alias(){
  emulate -L zsh
  DATE=$(gdate +"%Y-%m-%dT%H:%M:%S%:z")
  COMMAND=$(echo "$1" | cut -d " " -f 1)
  TARGET="$HOME/tracked-alias"
  # EXCLUDE=(
  #   ls
  #   vim
  # )

  if [[ -z "$COMMAND" ]] || [[ ${+aliases[$COMMAND]} -eq 0 ]]; then
    return
  fi

  for i in "${EXCLUDE[@]}"; do
    if [[ "$COMMAND" == "$i" ]]; then
      return
    fi
  done

  echo "$DATE $COMMAND" >> "$TARGET"
}

__track-alias-handler(){
  (__track-alias "$@" &)
}

add-zsh-hook preexec __track-alias-handler
