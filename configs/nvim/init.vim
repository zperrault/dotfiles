set nocompatible
syntax enable
filetype plugin indent on

call plug#begin('~/.config/nvim/plugged')
  source ~/.config/nvim/plugs.vim
call plug#end()

source ~/.config/nvim/settings.vim
source ~/.config/nvim/maps.vim
