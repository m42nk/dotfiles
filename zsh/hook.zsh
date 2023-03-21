preexec(){
  case "$1" in
    nrd|"npm run dev"|yrd|"yarn dev")
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
