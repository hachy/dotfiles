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
elseif has('xfontset')
  set guifontset=a14,r14,k14
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
" Toggle menu open if press <F2>
nnoremap <silent> <F2> :<C-u>if &guioptions =~# 'm' <Bar>
      \set guioptions-=m <Bar>
      \else <Bar>
      \set guioptions+=m <Bar>
      \endif <CR>
" 現在のファイルをブラウザで開く（firefox)
noremap <Leader>W :silent :! start firefox.exe %<CR>
