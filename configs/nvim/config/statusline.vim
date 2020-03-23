function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0 ? ' [' . l:branchname . '] ' : ''
endfunction
set laststatus=2
set statusline=
" left 
set statusline+=%{StatuslineGit()}
set statusline+=\ %n:%t
" center
set statusline+=%<
set statusline+=%=
set statusline+="you're doing great!"
set statusline+=%=
" right
set statusline+=%{gutentags#statusline()}
set statusline+=\ %m%r
set statusline+=\ %y
