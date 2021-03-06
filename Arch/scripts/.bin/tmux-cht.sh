#!/usr/bin/env bash

LANG=(
  nodejs
  javascript
  typescript
  cpp
  c
  lua
  python
  bash
  php
  haskell
  css
  html
  go
)

UTILS=(
  find
  man
  tldr
  sed
  awk
  tr
  cp
  ls
  grep
  xargs
  rg
  ps
  mv
  kill
  lsof
  less
  head
  tail
  tar
  cp
  rm
  rename
  jq
  cat
  ssh
  cargo
  git
  git-worktree
  git-status
  git-commit
  git-rebase
  docker
  docker-compose
  stow
  chmod
  chown
)

selected=`echo "${LANG[*]} ${UTILS[*]}" | tr ' ' '\n' | fzf`

if [[ -z $selected ]]; then
  exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" <(echo "${LANG[*]}"); then
  query=`echo $query | tr ' ' '+'`
  tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
  tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi

