##
## Aliases
##

VSMS_WT_DIR="$HOME/Work/vsms"

link-vsms(){
  CURR_GIT_ROOT="$(git rev-parse --show-toplevel)"

  # check if pwd is inside vsms 
  if [[ ! $CURR_GIT_ROOT =~ $VSMS_WT_DIR ]]; then
    echo "Not inside vsms"
    return 1
  fi

  # link env
  ln -s "${CURR_GIT_ROOT}/k8s/configs/env/development-platform/.env" "${CURR_GIT_ROOT}/.env.development"
  echo "Linked .env.development"

  # link node_modules
  ln -s "${VSMS_WT_DIR}/develop-platform/node_modules" "${CURR_GIT_ROOT}/node_modules"
  echo "Linked node_modules"
}

alias vsms="cd ${VSMS_WT_DIR}"
alias lv="link-vsms"
