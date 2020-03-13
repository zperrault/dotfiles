" vim has been around a long time so this disables support
" for old things you probably don't need
set nocompatible

" syntax highlighting and automatic indenting
syntax enable
filetype plugin indent on


" This sets the <Leader> key
let mapleader = ',' " You can make this what you want


call plug#begin('~/.nvim/plugged')

" An example plugin and one I recommend
"   https://github.com/scrooloose/nerdtree
"   `:help nerdtree`
Plug 'scrooloose/nerdtree'

" You can't put `Plug` calls after this
call plug#end()


set termguicolors " color
set number " line numbers on the left side

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


" Hitting ,<Tab> in normal or insert mode will 
" toggle the NERDTree file viewer
nnoremap <silent> <Leader><Tab>  :NERDTreeToggle<CR>
inoremap <silent> <Leader><Tab>  <ESC>:NERDTreeToggle<CR>

nnoremap <silent> <Leader>w  :w<CR>
nnoremap <silent> <Leader>q  :q<CR>
