#!/usr/bin/env bash -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


mkdir -p ~/.config

ln -s $DIR/../configs/alacritty ~/.config/alacritty

ln -s $DIR/../configs/finicky/finicky.js ~/.finicky.js

ln -s $DIR/../config/nvim ~/.config/nvim

ln -s $DIR/../config/tmux/tmux.conf ~/.tmux.confg

ln -s $DIR/../config/zsh/zshrc ~/.zshrc

ln -s $DIR/../bin ~/.bin
