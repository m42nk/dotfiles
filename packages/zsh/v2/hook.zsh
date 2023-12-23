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
