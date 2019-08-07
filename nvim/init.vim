set nocompatible
syntax enable
filetype plugin indent on
let mapleader = ','

call plug#begin('~/.vim/plugged')

" Base editor plugins 🙏 tpope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'

Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_add_default_project_roots = 0
let g:gutentags_cache_dir = '~/.ctags_cache/'
let g:gutentags_project_root = ['package.json', '.git']

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'typescript'] }
Plug 'paulrosania/vim-graphql', { 'for': ['graphql', 'javascript', 'typescript'] }
Plug 'othree/xml.vim', { 'for': ['javascript', 'typescript', 'xml', 'html', 'markdown'] }
let g:javascript_plugin_flow = 1
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'json', 'markdown', 'less', 'css', 'scss', 'sass'] }
let g:prettier#autoformat = 0
let g:prettier#config#prose_wrap = 'always'
autocmd BufWritePre *.ts,*.tsx,*.js,*.jsx,*.mjs,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
" TypeScript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'peitalin/vim-jsx-typescript', { 'for': 'typescript' }

" Snippets
Plug 'Shougo/neosnippet.vim'
let g:neosnippet#enable_conceal_markers=1
let g:neosnippet#disable_runtime_snippets = { '_': 1 }
let g:neosnippet#snippets_directory = '~/.config/nvim/snippets'
imap <C-k>  <Plug>(neosnippet_expand_or_jump)
smap <C-k>  <Plug>(neosnippet_expand_or_jump)
xmap <C-k>  <Plug>(neosnippet_expand_target)
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 0
let g:deoplete#omni#functions = {}
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['file', 'buffer', 'around', 'neosnippet']
let g:deoplete#omni#input_patterns = {}

" Postgres/Database stuff
Plug 'tpope/vim-dadbod'
Plug 'lifepillar/pgsql.vim', { 'for': ['sql', 'pgsql'] }
let g:sql_type_default = 'pgsql'
let g:pgsql_pl = ['python', 'javascript']

" Dash.app
Plug 'rizzatti/dash.vim'
nnoremap <Leader>d :Dash<CR>
nnoremap <Leader>D :Dash 

Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-sort-motion'
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
let g:VtrUseVtrMaps = 1

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
nnoremap <Leader>gs :Gstatus<CR>
" ',gb' will run a git blame
nnoremap <Leader>gp :Gpush --force-with-lease<CR>
nnoremap <Leader>gf :Gfetch<CR>
nnoremap <Leader>gr :Grebase 
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gh :Gbrowse<CR>
vnoremap <Leader>gh :Gbrowse<CR>
nnoremap <Leader>gb :Gblame<CR>

" custom text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'vimtaku/vim-textobj-keyvalue'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'

" colorscheme
Plug 'chriskempson/base16-vim'

" Plug 'file://' . expand('~/github/zperrault/sqitch.vim')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
nnoremap <silent> <Leader>f   :Files<CR>
nnoremap <silent> <Leader>b   :Buffers<CR>
nnoremap <silent> <Leader>t   :Tags<CR>
nnoremap <silent> <Leader>lt  :BTags<CR>
nnoremap <silent> <Leader>w   :Windows<CR>
nnoremap <silent> <Leader>a   :Ag<CR>


call plug#end()

" The basics
set termguicolors
colorscheme base16-tomorrow

set number
set relativenumber

set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a

nnoremap <ESC> :nohlsearch<CR>

let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_winsize=20
let g:netrw_is_open=0
function! ToggleNetrw()
  if g:netrw_is_open
    let i = bufnr("$")
    while i >= 1
      if getbufvar(i, "&filetype") == "netrw"
        execute "bwipeout ". i
      endif
      let i-=1
    endwhile
    let g:netrw_is_open=0
  else
    let g:netrw_is_open=1
    execute "Lexplore"
  endif
endfunction

nnoremap <Leader>~ :e + ~/.config/nvim/init.vim<cr>
nnoremap <Leader>so :source %<CR>
nnoremap <Leader>os :source %<CR>

nnoremap <Leader>sn :NeoSnippetEdit -split -vertical<CR>G
nnoremap <Leader>ns :NeoSnippetEdit -split -vertical<CR>G

function! Rand()
  return str2nr(system('echo $RANDOM'))
endfunction

let g:tips_file = expand('~/.config/nvim/tips.txt')

" statusline
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0 ? ' [' . l:branchname . '] ' : ''
endfunction
let g:tips = readfile(g:tips_file)
let g:tip = g:tips[Rand() % len(g:tips)]
set laststatus=2
set statusline=
" left 
set statusline+=%{StatuslineGit()}
set statusline+=\ %n:%t
" center
set statusline+=%<
set statusline+=%=
set statusline+=\ \ %{g:tip}
set statusline+=%=
" right
set statusline+=%{gutentags#statusline()}
set statusline+=\ %m%r
set statusline+=\ %y

" nnoremap <Leader>gt :vs + ~/.config/nvim/tips.txt<CR>

nnoremap <Leader>u :UndotreeToggle<CR>

let g:bigspring_local='postgres:bigspring_local'
nnoremap <Leader>pg :DB g:bigspring_local 
vnoremap <Leader>pg :DB g:bigspring_local<CR>

set path+=**
set wildmenu
set wildignore+=*/node_modules/*
set wildignore+=*/.git/*
set wildignore+=*/dist/* 
set wildignore+=*/build/* 
set wildignore+=*/archive/* 

" Sqitch stuff
function! GetCurrentSqitchChangeName()
  return expand('%:t:r')
endfunction
function! GetPathToSqitchChange(change, stage)
  return a:stage . '/' . a:change . '.sql'
endfunction
function! GetCurrentSqitchChangeStage()
  return expand('%:p:h:t')
endfunction
function! OpenAllFilesForSqitchChange(change)
  let l:stages = [ 'revert', 'verify', 'deploy']
  for stage in l:stages
    execute 'vsplit ' . GetPathToSqitchChange(a:change, stage)
  endfor
endfunction
nnoremap gD   :execute 'edit ' . GetPathToSqitchChange(GetCurrentSqitchChangeName(), 'deploy')<CR>
nnoremap gR   :execute 'edit ' . GetPathToSqitchChange(GetCurrentSqitchChangeName(), 'revert')<CR>
nnoremap gV   :execute 'edit ' . GetPathToSqitchChange(GetCurrentSqitchChangeName(), 'verify')<CR>
nnoremap gvD  :execute 'vsplit ' . GetPathToSqitchChange(GetCurrentSqitchChangeName(), 'deploy')<CR>
nnoremap gvR  :execute 'vsplit ' . GetPathToSqitchChange(GetCurrentSqitchChangeName(), 'revert')<CR>
nnoremap gvV  :execute 'vsplit ' . GetPathToSqitchChange(GetCurrentSqitchChangeName(), 'verify')<CR>
nnoremap gA   :call OpenAllFilesForSqitchChange(GetCurrentSqitchChangeName())<CR>

" wrap policy in conditional check
" 0wwwyiwOdo $$<CR>begin<CR>if not exists (<CR>select from pg_catalog.pg_policies where policyname = 'bigspring_profile_competency'<CR>) then

nnoremap <Leader>*  :execute 'vimgrep /' . expand('<cword>') . '/g **'<CR>
nnoremap <Leader>!  :execute 'read ! ' . getline('.')<CR>
nnoremap <silent> <Leader><TAB>  :call ToggleNetrw()<CR>

nnoremap ;  :
nnoremap q; q:
vnoremap ;  :
vnoremap q; q:
