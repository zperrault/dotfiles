Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-abolish'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' 

Plug 'scrooloose/nerdtree'

Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_disable_when_zoomed = 1

Plug 'tpope/vim-dadbod'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'christoomey/vim-sort-motion'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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

Plug 'sbdchd/neoformat'
let g:neoformat_enabled_typescriptreact = ['prettier']
augroup fmt
  autocmd!
  autocmd BufWritePre *.yml,*.yaml,*.json,*.js,*.jsx,*.ts,*.tsx,*.md,*.gql,*.graphql,*.re undojoin | Neoformat
augroup END

Plug 'godlygeek/tabular'


" |filetypes|
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'jparise/vim-graphql'
Plug 'lifepillar/pgsql.vim'
let g:sql_type_default = 'pgsql'

Plug 'chriskempson/base16-vim'

" Installed 3/21/20
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-peekaboo'
Plug 'markonm/traces.vim'
Plug 'terryma/vim-expand-region'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/a.vim'
" Plug 'dense-analysis/ale'
Plug 'Konfekt/vim-compilers'

Plug 'junegunn/goyo.vim'

Plug 'reasonml-editor/vim-reason-plus'

Plug 'tommcdo/vim-express'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
