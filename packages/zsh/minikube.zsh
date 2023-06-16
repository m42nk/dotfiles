[[ ! -f "/usr/local/bin/kubectl" ]] && sudo ln -s $(which minikube) /usr/local/bin/kubectl

source <(minikube completion zsh)
source <(kubectl completion zsh)

alias k="kubectl"
compdef _kubectl k

# setopt complete_aliases
# alias kubectl="minikube kubectl --"
# alias k="minikube kubectl --"
# compdef _kubectl k
# k () {
#   kubectl -- "$@"
# }
# compdef _minikube_kubectl k
# compdef '_dispatch kubectl kubectl' k
# compdef '_dispatch kubectl kubectl' k
