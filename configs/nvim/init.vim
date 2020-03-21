" vim has been around a long time so this disables support
" for old things you probably don't need
set nocompatible

" syntax highlighting and automatic indenting
syntax enable
filetype plugin indent on

" This sets the <Leader> key
let mapleader = ',' " You can make this what you want

call plug#begin('~/.config/nvim/plugged')

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-abolish'

  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb' 
  nnoremap <silent> <Leader>gs  :Git<CR>
  nnoremap <Leader>gp  :Git push --force-with-lease<CR>
  nnoremap <Leader>gf  :Git fetch<CR>
  nnoremap <Leader>grm :Git fetch<CR>:Git rebase origin/master<CR>
  nnoremap <Leader>gh  :Gbrowse<CR>
  vnoremap <Leader>gh  :Gbrowse<CR>gv

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
  Plug 'kana/vim-textobj-line'
  Plug 'christoomey/vim-sort-motion'

  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  nnoremap <silent> <Leader>f :Files<CR>
  nnoremap <silent> <Leader>a :Rg<CR>

  Plug 'ludovicchabant/vim-gutentags'
  let g:gutentags_add_default_project_roots = 0
  let g:gutentags_cache_dir = '~/.ctags_cache'
  let g:gutentags_project_root = ['package.json', '.git']

  Plug 'Shougo/neosnippet.vim'
  let g:neosnippet#enable_conceal_markers=1
  let g:neosnippet#disable_runtime_snippets = { '_': 1 }
  let g:neosnippet#snippets_directory = '~/.config/nvim/snippets'
  imap <C-k>  <Plug>(neosnippet_expand_or_jump)
  smap <C-k>  <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>  <Plug>(neosnippet_expand_target)
  nnoremap <Leader>sn :NeoSnippetEdit -split -vertical<CR>G
  if has('conceal')
    set conceallevel=2 concealcursor=niv
  endif

  Plug 'sbdchd/neoformat'
  augroup fmt
    autocmd!
    autocmd BufWritePre *.yml,*.yaml,*.json,*.js,*.jsx,*.ts,*.tsx,*.md,*.gql,*.graphql undojoin | Neoformat
  augroup END


  " |filetypes|
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'jparise/vim-graphql'

  Plug 'chriskempson/base16-vim'

  " Installed 3/21/20
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'Raimondi/delimitMate'
  Plug 'terryma/vim-expand-region'
  Plug 'vim-scripts/a.vim'
  Plug 'junegunn/vim-peekaboo'
  Plug 'markonm/traces.vim'
  Plug 'vim-scripts/ReplaceWithRegister'

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

nnoremap <silent> <Leader>~   :e ~/.config/nvim/init.vim<CR>
nnoremap <silent> <Leader>so  :source %<CR>

nnoremap <Leader>pi :PlugInstall<CR>

vnoremap <Leader>pg :DB postgresql://postgres:postgres@localhost:2345/postgres<CR>gv
nnoremap <Leader>pg :DB postgresql://postgres:postgres@localhost:2345/postgres 

vnoremap <silent> <Leader>y :w !pbcopy<CR><CR>:echom 'Copied to clipboard'<CR>

colorscheme base16-onedark
