set nocompatible
syntax enable
filetype plugin indent on

call plug#begin('~/.config/nvim/plugged')
  source ~/.config/nvim/config/plugs.vim
  source ~/.config/nvim/config/plugs.user.vim
call plug#end()

source ~/.config/nvim/config/settings.vim
source ~/.config/nvim/config/maps.vim
source ~/.config/nvim/config/statusline.vim
