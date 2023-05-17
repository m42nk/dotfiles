##
## Aliases
##

MCEASY_DIR="$HOME/Work"
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
alias pr-create="gh pr create --base develop-platform"

# env vars
[[ -f "$MCEASY_DIR/shell-env-vars" ]] && source "$MCEASY_DIR/shell-env-vars"

# jira
jira-fe(){
  jira issue list --columns key,type,summary,status -q'project = DEVA AND summary ~ "\\[FE\\]" AND sprint in openSprints()'
}

jira-sprint(){
  jira issue list -q"project = DEVA and sprint in openSprints()"
}

if [[ $(command -v google-chrome) ]] && [[ $(command -v jira) ]]; then
  export JIRA_BROWSER="$(which google-chrome)"
fi
