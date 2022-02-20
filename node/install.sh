#!/usr/bin/env bash

set -eu

install() {
  if node --version; then
    sudo npm update -g npm
  else
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt install -y nodejs
  fi
}

install
