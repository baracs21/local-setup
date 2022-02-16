#!/usr/bin/env bash

set -euo pipefail

INSTALL_DIR=$PWD

install() {
  if ! which aws &>/dev/null; then
    sudo apt-get update
    sudo apt-get install unzip -y

    mkdir "$INSTALL_DIR"/aws_tmp
    cd "$INSTALL_DIR"/aws_tmp
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    rm -rf "$INSTALL_DIR"/aws_tmp
  fi
}

install
