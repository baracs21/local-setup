#!/usr/bin/env bash

set -eu

#if [[ $EUID -ne 0 ]]; then
#  echo "$0 is not running as root. Try using sudo."
#  exit 2
#fi

sudo -v
ROOT_DIR=$PWD

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

update() {
  printf 'update system...'
  sudo apt update &>/dev/null
  sudo apt upgrade -y &>/dev/null &

  UPDATE_PID=$!
  while ps -ef | awk '{print $2}' | grep $UPDATE_PID &>/dev/null; do
    printf '.'
    sleep 1
  done

  # shellcheck disable=SC2059
  printf "${GREEN}done${NC}\n"
}

install() {
  tool=$1
  # shellcheck disable=SC2059
  printf "$tool..."
  status=${GREEN}installed${NC}
  cd "$ROOT_DIR"/"$tool" || exit
  if ! ./install.sh &>/dev/null; then
    status=${RED}failed${NC}
  fi
  # shellcheck disable=SC2059
  printf "${status}\n"
}

install_common() {
  sudo apt update &>/dev/null
  sudo apt install software-properties-common -y &>/dev/null
}

add_repositories() {
  echo "Add PPA repositories"
  echo "----------------------------------------"
  ppas=$*
  for ppa in $ppas; do
    sudo add-apt-repository "$ppa" -y &>/dev/null
    # shellcheck disable=SC2059
    printf "$ppa...${GREEN}added${NC}\n"
  done
  echo "----------------------------------------"
}

install_packages() {
  echo "Install apt packages"
  echo "----------------------------------------"
  packages=$*
  sudo apt update &>/dev/null
  sudo apt install "$@" -y &>/dev/null

  for package in $packages; do
    printf "%s..." "$package"
    # shellcheck disable=SC2059
    printf "${GREEN}installed${NC}\n"
  done
  echo "----------------------------------------"
}

install_npm_packages() {
  echo "Install npm packages"
  echo "----------------------------------------"
  packages=$*
  sudo npm i -g "$@" -y &>/dev/null
  for package in $packages; do
    printf "%s..." "$package"
    # shellcheck disable=SC2059
    printf "${GREEN}installed${NC}\n"
  done
  echo "----------------------------------------"
}

add_repositories \
  ppa:deadsnakes/ppa \
  ppa:longsleep/golang-backports
install_common
install_packages \
  golang-go \
  jq \
  python3 \
  python3-pip \
  mongo-tools
install azure
install sdkman
install taskfile
install node
install aws
install drawio
install_npm_packages \
  aws-cdk \
  tldr
install zsh
update
