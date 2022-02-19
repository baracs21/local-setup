#!/usr/bin/env bash

set -euo pipefail

install() {
  if [ ! -d "$HOME/.sdkman" ]; then
    apt update
    apt install zip unzip -y
    curl -s "https://get.sdkman.io" | bash
  fi
}

install
