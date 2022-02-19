#!/usr/bin/env bash

set -euo pipefail

install() {
  if ! which az &>/dev/null; then
    apt update
    apt install ca-certificates curl apt-transport-https lsb-release gnupg -y

    curl -sL https://packages.microsoft.com/keys/microsoft.asc |
      gpg --dearmor |
      tee /etc/apt/trusted.gpg.d/microsoft.gpg >/dev/null

    AZ_REPO=$(lsb_release -cs)
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
      tee /etc/apt/sources.list.d/azure-cli.list

    apt-get update
    apt-get install azure-cli -y
  else
    apt update
    apt upgrade -y
  fi
}

install
