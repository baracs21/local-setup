#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR=$PWD

install() {
  tool=$1
  cd "$ROOT_DIR"/"$tool"
  ./install.sh &> /dev/null
  echo "$tool"...installed.
}

install azure
install aws
install sdkman
install zsh
