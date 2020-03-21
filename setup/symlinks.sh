#!/usr/bin/env bash -ex

SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DIR="$SETUP_DIR/.."

function backup {
  mkdir -p $DIR/backups
  cp -r $1 "$DIR/backups/"
  rm -rf $1
}

function link_in_home {
  if [[ -a "$HOME/$2" ]]; then
    backup "$HOME/$2"
  fi
  ln -s "$DIR/$1" "$HOME/$2"
}

function link_config {
  link_in_home "configs/$1" $2
}


mkdir -p ~/.config

link_in_home "bin" ".bin"
link_config "alacritty" ".config/alacritty"
link_config "finicky/finicky.js" ".finicky.js"
link_config "nvim" ".config/nvim"
link_config "tmux/tmux.conf" ".tmux.conf"
link_config "zsh/zshrc" ".zshrc"
link_config "hammerspoon" ".hammerspoon"
