#!/usr/bin/env bash

set -euo pipefail

INSTALL_DIR=$PWD

install() {
  if ! which aws &>/dev/null; then
    apt-get update
    apt-get install unzip -y

    mkdir "$INSTALL_DIR"/aws_tmp
    cd "$INSTALL_DIR"/aws_tmp
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    ./aws/install
    rm -rf "$INSTALL_DIR"/aws_tmp

    curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
    dpkg -i session-manager-plugin.deb
    rm -f session-manager-plugin.deb

    wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
    unzip aws-sam-cli-linux-x86_64.zip -d sam-installation
    ./sam-installation/install

    rm -rf sam-installation
    rm -f aws-sam-cli-linux-x86_64.zip

    pip install cloudformation-cli cloudformation-cli-java-plugin cloudformation-cli-go-plugin cloudformation-cli-python-plugin cloudformation-cli-typescript-plugin
  fi
}

install
