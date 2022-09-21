preexec(){
  case "$1" in
    nrd)
      echo "::Rename tmux Server::"
      tmux rename-window "Server"
      ;;
    *)
      ;;
  esac
}
