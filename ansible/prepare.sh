#!/usr/bin/env bash

set -e

echo "Install dependenies"
# Install dependencies
sudo apt update -y
sudo apt install -y \
  git \
  python3 \
  python3-pip \
  python3-apt \
  python3-venv \
  ripgrep \
  tldr \
  bat \
  exa \
  fzf \
  fd-find \
  delta \
  kitty


echo "Install ansible"
# Install Ansible
pip3 install ansible

export PATH="$PATH:$HOME/.local/bin"

# Add collection
ansible-galaxy collection install community.general

echo "Setup git"
# Git config
git config --global user.email "mail.syakhisk@gmail.com"
git config --global user.name "Syakhisk Al-Azmi"
