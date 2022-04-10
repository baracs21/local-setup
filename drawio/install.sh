#!/usr/bin/env bash

set -euo pipefail

install() {
  if [ ! "$(which drawio)" ]; then
    sudo apt update
    sudo apt -y install wget curl
    curl -s https://api.github.com/repos/jgraph/drawio-desktop/releases/latest | grep browser_download_url | grep '\.deb' | cut -d '"' -f 4 | wget -i -
    sudo apt -f install ./drawio-amd64-*.deb -y
    rm -f ./drawio-amd64-*.deb
  fi
}

install
