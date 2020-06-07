" This sets the <Leader> key
let mapleader = ',' " You can make this what you want

nnoremap <silent> <Leader>gs  :Git<CR>
nnoremap <Leader>gp  :Git push --force-with-lease<CR>
nnoremap <Leader>gf  :Git fetch<CR>
nnoremap <Leader>grm :Git fetch<CR>:Git rebase origin/master<CR>
nnoremap <Leader>gh  :Gbrowse<CR>
vnoremap <Leader>gh  :Gbrowse<CR>gv

nnoremap <silent> <Leader><Tab>  :NERDTreeToggle<CR>
inoremap <silent> <Leader><Tab>  <ESC>:NERDTreeToggle<CR>

nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>a :Rg<CR>

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


vnoremap <silent> <Leader>y :w !pbcopy<CR><CR>:echom 'Copied to clipboard'<CR>


nnoremap <Leader>spgd :DB g:current_db = 

let g:dev_db = 'postgresql://postgres:postgres@localhost:2345/postgres'
let g:test_db = 'postgresql://postgres:postgres@0.0.0.0:8899/postgres'
let g:current_db = g:dev_db
vnoremap <Leader>pg   :DB g:current_db<CR>gv
nnoremap <Leader>pg   :DB g:current_db 


nnoremap <Leader>!  :Dispatch 
