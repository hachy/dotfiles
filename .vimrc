set nocompatible

set runtimepath+=$HOME/.vim,$HOME/.vim/after
" set runtimepath^=$HOME/.vim
" set runtimepath+=$HOME/.vim/after

" neobundle"{{{
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'tpope/vim-surround'
" NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'skammer/vim-css-color'
" NeoBundle 'groenewege/vim-less'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tomtom/tcomment_vim'

" filetype plugin indent on
filetype on

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif
"}}}

"-----------------------------------------------------------------------------
" Basic"{{{
if has("syntax")
  syntax on
endif
set ruler
set cursorline
set title
set number
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
" Highlight parenthesis
set showmatch
" Show command on statusline
set showcmd
set cmdheight=2
" Show <TAB> and <CR>
set list
" Show 'invisible' characters
set listchars=tab:>-,trail:-,extends:>,precedes:<
" Allow backspace in insert mode
set backspace=indent,eol,start
" Enable mouse in all modes
set mouse=a
" Do not display greetings message
set shortmess=aTI
" Enable multibyte format.
set formatoptions+=mM
" Increment/Decrement the alphabet by pressing <C-a>/<C-x>
set nrformats=alpha,octal,hex
" Folding
set foldenable
set foldmethod=marker
set foldcolumn=1
" No backups
set nobackup
set noswapfile
" Move the cursor to positions where there isn't any text
set virtualedit=all

set textwidth=0
set scrolloff=5

" set colorcolumn=85

au! FileType scss syntax cluster sassCssAttributes add=@cssColors
"}}}

" Color"{{{
colorscheme glitter
set background=dark
gui
set transparency=250
"}}}

" Tabline"{{{
set showtabline=2
nmap <C-S-Tab> :tabprevious<CR>
nmap <C-Tab> :tabnext<CR>
map <C-S-Tab> :tabprevious<CR>
map <C-Tab> :tabnext<CR>
imap <C-S-Tab> <Esc>:tabprevious<CR>a
imap <C-Tab> <Esc>:tabnext<CR>a
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>
"}}}


" Search"{{{
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
nnoremap <Esc><Esc> :<C-u>set nohlsearch<CR>
nnoremap / :<C-u>set hlsearch<CR>/
nnoremap ? :<C-u>set hlsearch<CR>?
nnoremap * :<C-u>set hlsearch<CR>*
nnoremap # :<C-u>set hlsearch<CR>#
"}}}

" Statusline"{{{
set laststatus=2
" set statusline=%<\%F\ %y%m%r%=%{''.(&fenc!=''?&fenc:&enc).''}\ %{(&bomb?\",BOM\":\"\")}\ %{&ff}\ %3p%%\ [%4l:%3c]
set statusline=%<\%F\ %y%m%r%=%{''.(&fenc!=''?&fenc:&enc).''}\%{(&bomb?\",BOM\":\"\")}\ %{&ff}\ %3p%%\ [%4l:%3c]\ %{SearchCount()}

" set statusline=
" "set statusline+=%1*\ %n\                                 "buffernr
" set statusline+=%1*\ %<%F\                                "File+path
" set statusline+=%2*\ %2(\%M%r\ %)                         "Modified? Readonly?
" set statusline+=%3*\ %=%y\ %{''.(&fenc!=''?&fenc:&enc).''}\ %{(&bomb?\",BOM\":\"\")}\ %{&ff}\     "FileType/Encoding/FileFormat(dos/unix..)
" set statusline+=%3*\ \%3p%%\                              "total (%)
" set statusline+=%3*\ \[%4l,%3c]\                            "Rownumber, Colnr
" set statusline+=%{SearchCount()}
" "set statusline+=%0*\ \%w\ %P\ \                          "Top/bot.

function! SearchCount()
  let pos=getpos('.')
  try
    redir => subscount
    silent %s///gne
    redir END
    let result=matchstr(subscount, '\d\+')
    return result
  finally
    call setpos('.', pos)
  endtry
endfunction
"}}}

" Keymappings"{{{
" move
nnoremap <C-h> <Home>
vnoremap <C-h> <Home>
nnoremap <C-l> <End>
vnoremap <C-l> <End>
" inoremap <Space>h <Home>
" inoremap <Space>l <End>
" inoremap <C-h> <Left>
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-l> <Right>
inoremap <silent><expr><C-h> pumvisible() ? "\<C-y>\<Left>" : "\<Left>"
inoremap <silent><expr><C-j> pumvisible() ? "\<C-y>\<Down>" : "\<Down>"
inoremap <silent><expr><C-k> pumvisible() ? "\<C-y>\<Up>" : "\<Up>"
inoremap <silent><expr><C-l> pumvisible() ? "\<C-y>\<Right>" : "\<Right>"
inoremap <C-d> <delete>

nnoremap <C-Space> <PageDown>
nnoremap <S-Space> <PageUp>

" search
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" brackets
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap < <><Left>
inoremap " ""<Left>
inoremap ' ''<Left>

" Yank the characters under the cursor until the end of the line
nnoremap Y y$
" Enter = o
noremap <CR> o<Esc>
" C-c == ESC
inoremap <C-c> <Esc>
" F1 == ESC
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" Close help by pressing q.
autocmd FileType help nnoremap <buffer> q <C-w>c
" コメントアウトが連続して入力されるのを禁止 :a!でも代用可
autocmd FileType * setlocal formatoptions-=ro
" Disable unused keys
nnoremap ZZ  <Nop>
map q: <Nop>
map q  <Nop>
" # == *
nmap # *
" help vertical topleft
nnoremap <Space>h :<C-u>vert to h<Space>
" Visual mode で検索
vnoremap <silent> # "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

" PHP errors check
map <C-p><C-h><C-p> :!C:\xampp\php\php -l "%"<CR>
"}}}

" Encoding"{{{
set encoding=utf-8

if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
"}}}

" 全角スペースを強調表示"{{{
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif
"}}}

"-----------------------------------------------------------------------------
" Unite.vim"{{{
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uf :<C-u>Unite file<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,uo :<C-u>Unite outline<CR>
nnoremap <silent> ,ur :<C-u>Unite history/yank -buffer-name=register register<CR>
" Keymappings for unite.vim
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " Escキーを2回押すと終了する
  nmap <silent><buffer> <Esc><Esc> q
  imap <silent><buffer> <Esc><Esc> <Esc>q
endfunction

" let g:unite_source_history_yank_enable = 1
" nnoremap <silent> ,gy :<C-u>Unite history/yank<CR>
"}}}

" Zencoding snippets"{{{
let g:user_zen_settings = {
\  'indentation' : '  ',
\  'lang' : 'ja',
\  'charset': "utf-8",
\  'html': {
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."    <meta charset=\"${charset}\">\n"
\              ."    <title></title>\n"
\              ."    <link rel=\"stylesheet\" href=\"reset.css\">\n"
\              ."</head>\n"
\              ."<body>\n${child}|\n"
\              ."<script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js\"></script>\n"
\              ."</body>\n"
\              ."</html>",
\    }
\  }
\}
"}}}

" neocomplcache"{{{
let g:neocomplcache_enable_at_startup = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'ruby' : expand('$HOME/.vim/dict/ruby.dict'),
      \ 'javascript' : expand('$HOME/.vim/dict/jquery.dict'),
      \ 'css' : expand('$HOME/.vim/dict/css3.dict'),
      \ }

" Keymappings for neocomplchace (and neosnippet?)
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<Up>" : "\<S-Tab>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"}}}

" neosnippet"{{{
" Keymappings for neosnippet
imap <C-o> <Plug>(neosnippet_expand_or_jump)
smap <C-o> <Plug>(neosnippet_expand_or_jump)

" let g:neosnippet#enable_snipmate_compatibility = 1
" Define directory
let g:neosnippet#snippets_directory = $HOME.'/.vim/snippets'
"}}}

" vimfiler"{{{
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_edit_action = 'tabopen'
nnoremap <Space>vf :<C-u>VimFiler<CR>
"}}}

" vimshell"{{{
nnoremap <Space>vs :VimShell<CR>
let g:vimshell_prompt = '$ '
"}}}

" quickrun"{{{
" let b:quickrun_config = {'outputter/buffer/into': 1}
let g:quickrun_config = {}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s'], 'into': 1}
let g:quickrun_config['ruby'] = {'command' : 'ruby', 'into': 1}
"}}}

" vim-ref"{{{
let g:ref_refe_cmd = $HOME."/rubyref/refe-1_9_3"
let g:ref_refe_encoding = 'cp932'
let g:ref_use_vimproc = 1
let g:ref_open = 'vsplit'
nmap ,rr :<C-u>Ref refe<Space>

autocmd FileType ref call s:initialize_ref_viewer()
function! s:initialize_ref_viewer()
  nmap <buffer> b <Plug>(ref-back)
  nmap <buffer> f <Plug>(ref-forward)
  nnoremap <buffer> q <C-w>c
  setlocal nonumber
endfunction
"}}}

"-----------------------------------------------------------------------------
" Edit .vimrc .gvimc"{{{
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>
" Load .gvimrc after .vimrc edited at GVim.
nnoremap <silent> <F5> :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <F4> :<C-u>source $MYGVIMRC<CR>
"}}}

" エンコーディングutf-8を優先する"{{{
let &fileencodings=substitute(substitute(&fileencodings, ',\?utf-8', '', 'g'), 'cp932', 'utf-8,cp932', '')"}}}
