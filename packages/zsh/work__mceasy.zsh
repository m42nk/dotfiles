_red() { echo -e "\e[31m$1\e[0m"; }
_green() { echo -e "\e[32m$1\e[0m"; }
_gray() { echo -e "\e[90m$1\e[0m"; }
_blue() { echo -e "\e[34m$1\e[0m"; }

##
## Aliases
##

MCEASY_DIR="$HOME/Work"
VSMS_WT_DIR="$HOME/Work/vsms"

link-vsms(){
  CURR_GIT_ROOT="$(git rev-parse --show-toplevel)"
  SRC_BRANCH="${1:-develop-platform}"

  # check if pwd is inside vsms 
  if [[ ! $CURR_GIT_ROOT =~ $VSMS_WT_DIR ]]; then
    echo "Not inside vsms"
    return 1
  fi

  # link env
  ln -s "${VSMS_WT_DIR}/${SRC_BRANCH}/.env.development" "${CURR_GIT_ROOT}/.env.development"
  echo "Linked .env.development"

  # link node_modules
  ln -s "${VSMS_WT_DIR}/${SRC_BRANCH}/node_modules" "${CURR_GIT_ROOT}/node_modules"
  echo "Linked node_modules"
}

wt-inactive(){
  INACTIVE_DIR="$VSMS_WT_DIR/_inactives"

  if [[ -z "$1" ]]; then
    echo "Usage: wt-inactive <worktree-dir>"
    return 1
  fi

  if [[ ! -d "$1" ]]; then
    echo "$1 is not a directory"
    return 1
  fi

  CWD="$(pwd)"
  cd $VSMS_WT_DIR/develop-platform
  git worktree move "$1" "$INACTIVE_DIR/$1"
  echo "Moved $1 to $INACTIVE_DIR/$1"
  cd "$CWD"
}

wt-activate(){
  INACTIVE_DIR="$VSMS_WT_DIR/_inactives"

  if [[ -z "$1" ]]; then
    echo "Usage: wt-activate <worktree-dir>"
    return 1
  fi

  if [[ ! -d "$1" ]]; then
    echo "$1 is not a directory"
    return 1
  fi

  CWD="$(pwd)"
  cd $VSMS_WT_DIR/develop-platform
  git worktree move "$INACTIVE_DIR/$1" "$VSMS_WT_DIR/$1"
  echo "Moved $INACTIVE_DIR/$1 to $1"
  cd "$CWD"
}

# pr-create(){
#   # alias pr-create="gh pr create --base develop-platform --reviewer ersakantibelva --reviewer fathilarham"
#   default_branch="develop-platform"
#   read "target_branch?Target branch (default: $default_branch): "

#   if [[ -z "$target_branch" ]]; then
#     target_branch="$default_branch"
#   fi

#   echo "Creating PR to $target_branch"
# }

icr(){
  ICR_DIR="$VSMS_WT_DIR/_icr-sandbox"
  code "$ICR_DIR"
}

alias vsms="cd ${VSMS_WT_DIR}"
alias lv="link-vsms"
alias lvstg="link-vsms staging"
alias pr-create-feature="gh pr create --base develop-platform --reviewer ersakantibelva --reviewer fathilarham"
alias pr-create-relfix="gh pr create --base staging --reviewer ersakantibelva --reviewer fathilarham --reviewer ahmadmustainmarzuki"
# alias move-branch-to-inactive='fd -d 1 -E develop-platform -E inactives -E staging -a -x git -C develop-platform worktree move "{}" inactives'

# env vars
[[ -f "$MCEASY_DIR/shell-env-vars" ]] && source "$MCEASY_DIR/shell-env-vars"

# jira
jira-fe(){
  # jira issue list --columns key,type,summary,status -q'project = DEVA AND summary ~ "\\[FE\\]" AND sprint in openSprints()'
  jira issue list --columns key,type,summary,status -q'project = ME AND summary ~ "\\[FE\\]" AND sprint in openSprints()'
}

jira-sprint(){
  # jira issue list -q"project = DEVA and sprint in openSprints()"
  jira issue list -q"project = ME and sprint in openSprints()"
}

if [[ $(command -v google-chrome) ]] && [[ $(command -v jira) ]]; then
  export JIRA_BROWSER="$(which google-chrome)"
fi
