#!/usr/bin/env bash

set -eu

install() {
  if node --version; then
    npm update -g npm
  else
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    apt-get install -y nodejs
  fi
}

install
