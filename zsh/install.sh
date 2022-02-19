#!/usr/bin/env bash

set -euo pipefail

install_zsh() {
  if ! command -v zsh; then
    apt install -y zsh
    zsh_path=$(command -v zsh)
    chsh -s "$zsh_path"
  else
    apt update
    apt upgrade -y
  fi

  if ! grep ZSH_VERSION <"$HOME"/.bashrc; then
    cat <<\EOF >>"$HOME"/.bashrc
export SHELL=$(which zsh)
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l
EOF
  fi

}

install_oh_my_zsh() {
  if ! [ -d "$HOME"/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
  fi
}

install_antibody() {
  if ! which antibody; then
    curl -sfL git.io/antibody | sh -s - -b /usr/local/bin
  fi
}

setup_zsh() {
  if ! [ -d "$HOME"/.zsh/completion ]; then
    mkdir -p ~/.zsh/completion
    curl -L https://raw.githubusercontent.com/docker/compose/1.27.4/contrib/completion/zsh/_docker-compose >~/.zsh/completion/_docker-compose
  fi

  cp .bash_aliases ~/.bash_aliases
  cp .zshrc ~/.zshrc
  cp .zsh_plugins.txt ~/.zsh_plugins.txt
  cp .p10k.zsh ~/.p10k.zsh
}

install_zsh
install_oh_my_zsh
install_antibody

setup_zsh
