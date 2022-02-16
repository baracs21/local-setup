#!/usr/bin/env bash

set -euo pipefail

install() {
  if [ ! -d "$HOME/.sdkman" ]; then
    sudo apt update
    sudo apt install zip unzip -y
    curl -s "https://get.sdkman.io" | bash
  fi
}

install
