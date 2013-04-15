" Fonts
if has('win32')
  set guifont=Consolas:h11
  set guifontwide=MeiryoKe_Console:h11:cSHIFTJIS
  set linespace=2
  if has('kaoriya')
    set ambiwidth=auto
  endif
elseif has('mac')
  set guifont=Osaka－等幅:h14
else
  " For linux
  set guifont=Ricty\ 12
endif

" Don't flick cursor.
set guicursor=a:blinkon0
" Disable bell.
set novisualbell
set vb t_vb=
" Hide toolbar and menus
set guioptions-=m
set guioptions-=T
" Not guitablabel
set guioptions-=e
" Scrollbar is always off(left)
set guioptions-=L

set columns=130
set lines=40

" Toggle menu open if press <F2>
nnoremap <silent> <F2> :<C-u>if &guioptions =~# 'm' <Bar>
      \set guioptions-=m <Bar>
      \else <Bar>
      \set guioptions+=m <Bar>
      \endif <CR>
" 現在のファイルをブラウザで開く（firefox)
noremap <Leader>W :silent :! start firefox.exe %<CR>

" " Statusline - changes colors depending on insert mode"{{{
" function! DefaultStatusline()
"   hi User1  guifg=#8EFFC1  guibg=#333333
"   hi User2  guifg=#FF288E  guibg=#333333  gui=bold
" endfunction
" 
" function! InsertStatuslineColor(mode)
"   if a:mode == 'i'
"     hi User2  guifg=#FF0066  guibg=#333333  gui=bold
"   endif
" endfunction
" 
" "call function
" call DefaultStatusline()
" au InsertEnter * call InsertStatuslineColor(v:insertmode)
" au InsertLeave * call DefaultStatusline()
" "}}}
