#!/usr/bin/env bash

set -eu

if [[ $EUID -ne 0 ]]; then
  echo "$0 is not running as root. Try using sudo."
  exit 2
fi

ROOT_DIR=$PWD

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

update() {
  printf 'update system...'
  apt update &>/dev/null
  apt upgrade -y &>/dev/null &

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
  apt update &>/dev/null
  apt install software-properties-common -y &>/dev/null
}

add_repositories() {
  add-apt-repository ppa:deadsnakes/ppa -y &>/dev/null
  add-apt-repository ppa:longsleep/golang-backports -y &>/dev/null
  # shellcheck disable=SC2059
  printf "PPAs...${GREEN}added${NC}\n"
}

install_packages() {
  packages=$*
  apt update &>/dev/null
  apt install "$@" -y &>/dev/null

  for package in $packages; do
    printf "%s..." "$package"
    apt install "$package" -y &>/dev/null
    # shellcheck disable=SC2059
    printf "${GREEN}installed${NC}\n"
  done

}

add_repositories
install_common
install azure
install aws
install sdkman
install taskfile
install node
install zsh
install_packages golang-go jq python3 python3-pip
update
