#!/usr/bin/env bash

echo -e "status: "
git status -s
echo -e "\nstaging file..."
git add .
echo -e "\nstaged: "
git status -s

echo -e "\ncommitting.."
git commit -m "update"

read -r -p "Push changes? [Y/n] " CONFIRM
if [[ "$CONFIRM" == "y" ]] || [[ "$CONFIRM" == "Y"  ]] || [[ -z "$CONFIRM" ]]; then
  git push
fi
