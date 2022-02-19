#!/usr/bin/env bash

set -euo pipefail

install() {
  if ! task --version; then
    sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin
  fi
}

install
