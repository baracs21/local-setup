#!/usr/bin/env bash

set -euo pipefail


install() {
  if npm --version; then
    sudo npm i -g aws-cdk
  fi
}

install
