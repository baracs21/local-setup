#!/usr/bin/env bash

set -euo pipefail

install() {
  if ! which az &>/dev/null; then
    sudo apt update
    sudo apt install ca-certificates curl apt-transport-https lsb-release gnupg -y

    curl -sL https://packages.microsoft.com/keys/microsoft.asc |
      gpg --dearmor |
      sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg >/dev/null

    AZ_REPO=$(lsb_release -cs)
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
      sudo tee /etc/apt/sources.list.d/azure-cli.list

    sudo apt-get update
    sudo apt-get install azure-cli -y
  else
    sudo apt update
    sudo apt upgrade -y
  fi
}

install
