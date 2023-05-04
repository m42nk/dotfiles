#!/usr/bin/env bash

# Install dependencies
sudo apt update -y
sudo apt install -y \
  git \
  python3 \
  python3-pip \
  python3-apt

# Install Ansible
pip3 install ansible

# Add collection
ansible-galaxy collection install community.general
