" vim has been around a long time so this disables support
" for old things you probably don't need
set nocompatible

" syntax highlighting and automatic indenting
syntax enable
filetype plugin indent on

" This sets the <Leader> key
let mapleader = ',' " You can make this what you want

call plug#begin('~/.nvim/plugged')

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'

  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  nnoremap <silent> <Leader>gs  :Git<CR>
  nnoremap <Leader>gp  :Git push --force-with-lease<CR>
  nnoremap <Leader>gf  :Git fetch<CR>
  nnoremap <Leader>grm :Git fetch<CR>:Git rebase origin/master<CR>

  " An example plugin and one I recommend
  "   https://github.com/scrooloose/nerdtree
  "   `:help nerdtree`
  Plug 'scrooloose/nerdtree'
  nnoremap <silent> <Leader><Tab>  :NERDTreeToggle<CR>
  inoremap <silent> <Leader><Tab>  <ESC>:NERDTreeToggle<CR>

  Plug 'christoomey/vim-tmux-navigator'
  let g:tmux_navigator_disable_when_zoomed = 1

  Plug 'tpope/vim-dadbod'

  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-indent'
  Plug 'christoomey/vim-sort-motion'

  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  nnoremap <silent> <Leader>f   :Files<CR>
  nnoremap <silent> <Leader>a   :Ag<CR>

  Plug 'chriskempson/base16-vim'

call plug#end()


set termguicolors " color
set number " line numbers on the left side
set relativenumber " line numbers are relative from cursor

" two space tabwidth and use spaces instead of tabs
set tabstop=2
set shiftwidth=2
set expandtab

" use your mouse if you want
set mouse=a

" An example mapping
nnoremap <silent> <ESC> :nohlsearch<CR>
" hit escape to un-highlight your search results

" The `;` doesn't do much useful by default and `:`
" is used all the time. This maps `;->:` in normal
" and visual modes where `:` would normally enter
" you into command mode. Save you some shift and
" maybe some RSI
nnoremap ;  :
nnoremap q; q:
vnoremap ;  :
vnoremap q; q:

nnoremap <silent> <Down>  :echom "Use `j` instead"<CR>
nnoremap <silent> <Up>    :echom "Use `k` instead"<CR>
nnoremap <silent> <Left>  :echom "Use `h` instead"<CR>
nnoremap <silent> <Right> :echom "Use `l` instead"<CR>
inoremap <silent> <Down>  <ESC>:echom "Use `j` instead"<CR>a
inoremap <silent> <Up>    <ESC>:echom "Use `k` instead"<CR>a
inoremap <silent> <Left>  <ESC>:echom "Use `h` instead"<CR>a
inoremap <silent> <Right> <ESC>:echom "Use `l` instead"<CR>a
vnoremap <silent> <Down>  <ESC>:echom "Use `j` instead"<CR>gv
vnoremap <silent> <Up>    <ESC>:echom "Use `k` instead"<CR>gv
vnoremap <silent> <Left>  <ESC>:echom "Use `h` instead"<CR>gv
vnoremap <silent> <Right> <ESC>:echom "Use `l` instead"<CR>gv

nnoremap <silent> <Leader>w   :w<CR>
nnoremap <silent> <Leader>q   :q<CR>
nnoremap <silent> <Leader>wq  :wq<CR>

nnoremap <silent> <Leader>~ :e + ~/.config/nvim/init.vim<cr>
nnoremap <silent> <Leader>so  :source %<CR>

colorscheme base16-onedark
