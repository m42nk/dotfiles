preexec(){
  case "$1" in
    nrd|"npm run dev"|"npm run serve"|yrd|"yarn dev"|"yarn serve"|"pn dev"|"pn serve")
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
