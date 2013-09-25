set nocompatible

set runtimepath+=$HOME/.vim,$HOME/.vim/after

augroup MyAutoCmd
  autocmd!
augroup END

" neobundle"{{{
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'Shougo/neocomplcache'
call neobundle#config('neocomplcache', {
      \ 'lazy' : 1,
      \ 'autoload' : {
      \   'insert' : 1,
      \ }})

NeoBundle 'Shougo/unite.vim'
call neobundle#config('unite.vim',{
      \ 'lazy' : 1,
      \ 'autoload' : {
      \   'commands' : [{ 'name' : 'Unite',
      \                   'complete' : 'customlist,unite#complete_source'}]
      \ }})

NeoBundle 'Shougo/vimfiler'
call neobundle#config('vimfiler', {
      \ 'lazy' : 1,
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \    'commands' : [{ 'name' : 'VimFiler',
      \                    'complete' : 'customlist,vimfiler#complete' },
      \                    'VimFilerExplorer', 'VimFilerCreate']
      \ }})

NeoBundle 'Shougo/vimshell'
call neobundle#config('vimshell', {
      \ 'lazy' : 1,
      \ 'autoload' : {
      \   'commands' : [{ 'name' : 'VimShell',
      \                   'complete' : 'customlist,vimshell#complete'},
      \                   'VimShellPop']
      \ }})

NeoBundleLazy 'thinca/vim-quickrun', { 'autoload' : {
      \ 'mappings': '<Plug>(quickrun)'
      \ }}

NeoBundleLazy 'thinca/vim-ref', { 'autoload' : {
      \ 'commands' : 'Ref',
      \ 'filetypes': ['ruby']
      \ }}

NeoBundleLazy 'skammer/vim-css-color', { 'autoload' : {
      \ 'filetypes' : ['css', 'scss']
      \ }}

NeoBundleLazy 'glidenote/memolist.vim', { 'autoload' : {
      \ 'commands' : ['MemoNew', 'MemoList', 'MemoGrep']
      \ }}

NeoBundleLazy 'yuratomo/w3m.vim', { 'autoload' : {
      \ 'commands' : ['W3m', 'W3mHistory']
      \ }}

NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tomtom/tcomment_vim'

filetype plugin indent on     " Required!

" Installation check.
NeoBundleCheck
"}}}

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
set cmdwinheight=5
set pumheight=15
set history=200
" Show <TAB> and <CR>
set list
" Show 'invisible' characters
set listchars=tab:»-,trail:-,extends:»,precedes:«
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
set foldcolumn=0
autocmd MyAutoCmd FileType vim setlocal foldcolumn=2
" No backups
set nobackup
set noswapfile
" Move the cursor to positions where there isn't any text
set virtualedit=block

set textwidth=0
set scrolloff=5

" neosnippet で変なの出さない
set completeopt-=preview

" set colorcolumn=85
"}}}

" Color"{{{
set t_Co=256
colorscheme glitter
set background=dark
if has('win32')
  gui
  set transparency=240
endif
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

nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
" # == *
nmap # *
" count number of matches
nmap ,c :%s///gn<CR>
"}}}

" Statusline"{{{
set laststatus=2
set statusline=%<\%F\ %y%m%r%=%{fugitive#statusline()}\ %{''.(&fenc!=''?&fenc:&enc).''}\%{(&bomb?\",BOM\":\"\")}\ %{&ff}\ %3p%%\ [%4l:%3c]
"}}}

" Keymappings"{{{
" move
nnoremap <C-h> <Home>
vnoremap <C-h> <Home>
nnoremap <C-l> <End>
vnoremap <C-l> <End>

inoremap <silent><expr><C-h> pumvisible() ? "\<C-y>\<Left>" : "\<Left>"
inoremap <silent><expr><C-j> pumvisible() ? "\<C-y>\<Down>" : "\<Down>"
inoremap <silent><expr><C-k> pumvisible() ? "\<C-y>\<Up>" : "\<Up>"
inoremap <silent><expr><C-l> pumvisible() ? "\<C-y>\<Right>" : "\<Right>"
inoremap <C-d> <delete>

nnoremap <C-Space> <PageDown>
nnoremap <S-Space> <PageUp>

" brackets
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap < <><Left>
inoremap " ""<Left>
inoremap ' ''<Left>

" Yank the characters under the cursor until the end of the line
nnoremap Y y$
" Enter == o
noremap <CR> o<Esc>
" C-c == ESC
inoremap <C-c> <Esc>
" F1 == ESC
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" Close help by pressing q.
autocmd MyAutoCmd FileType help nnoremap <buffer> q <C-w>c
" コメントアウトが連続して入力されるのを禁止 :a!でも代用可
autocmd MyAutoCmd FileType * setlocal formatoptions-=ro
" Disable unused keys
nnoremap ZZ <Nop>
" Disable Ex-mode
nnoremap Q <Nop>
nnoremap q <Nop>
" for tmux prefix key
nnoremap <C-z> <Nop>
inoremap <C-z> <Nop>
vnoremap <C-z> <Nop>
" help vertical topleft
nnoremap <Space>h :<C-u>vert to h<Space>
" Visual mode で検索
vnoremap <silent> # "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>
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
  autocmd MyAutoCmd BufReadPost * call AU_ReCheck_FENC()
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

" Command line"{{{
nnoremap <SID>(command-line-enter) q:
xnoremap <SID>(command-line-enter) q:
nnoremap <SID>(command-line-norange) q:<C-u>

nmap :  <SID>(command-line-enter)
xmap :  <SID>(command-line-enter)

autocmd MyAutoCmd CmdwinEnter * call s:init_cmdwin()
function! s:init_cmdwin()
  nnoremap <buffer> q :<C-u>quit<CR>
  nnoremap <buffer> <TAB> :<C-u>quit<CR>
  inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"

  " Completion.
  inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  startinsert!
endfunction
"}}}

" Unite.vim"{{{
let g:unite_data_directory = $HOME.'/.tmp/.unite'
let s:bundle = neobundle#get("unite.vim")
function! s:bundle.hooks.on_source(bundle)
  let g:unite_source_file_mru_limit = 200
  " Keymappings for unite.vim
  autocmd MyAutoCmd FileType unite call s:unite_my_settings()
  function! s:unite_my_settings()
    " Escキーを2回押すと終了する
    nmap <silent><buffer> <Esc><Esc> q
    imap <silent><buffer> <Esc><Esc> <Esc>q
  endfunction
endfunction
unlet s:bundle

nnoremap <silent> ,uf :<C-u>Unite file<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,uo :<C-u>Unite outline<CR>
nnoremap <silent> ,ur :<C-u>Unite history/yank -buffer-name=register register<CR>
"}}}

" neocomplcache"{{{
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_temporary_dir = $HOME.'/.tmp/.neocon'

let s:bundle = neobundle#get("neocomplcache")
function! s:bundle.hooks.on_source(bundle)
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

  " Enable omni completion.
  autocmd MyAutoCmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  " autocmd MyAutoCmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd MyAutoCmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  " autocmd MyAutoCmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " Enable heavy omni completion.
  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
  autocmd MyAutoCmd FileType ruby setlocal omnifunc=rubycomplete#Complete
endfunction
unlet s:bundle

" Keymappings for neocomplchace (and neosnippet?)
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<Up>" : "\<S-Tab>"
"}}}

" neosnippet"{{{
" Keymappings for neosnippet
imap <C-o> <Plug>(neosnippet_expand_or_jump)
smap <C-o> <Plug>(neosnippet_expand_or_jump)
" Define directory
let g:neosnippet#snippets_directory = $HOME.'/.vim/snippets'
"}}}

" vimfiler"{{{
let g:vimfiler_data_directory= $HOME.'/.tmp/.vimfiler'
let s:bundle = neobundle#get("vimfiler")
function! s:bundle.hooks.on_source(bundle)
  let g:vimfiler_safe_mode_by_default = 0
  let g:vimfiler_as_default_explorer = 1
  let g:vimfiler_edit_action = 'tabopen'
endfunction
unlet s:bundle

nnoremap <Space>vf :<C-u>VimFiler<CR>
"}}}

" vimshell"{{{
let g:vimshell_temporary_directory = $HOME.'/.tmp/.vimshell'
let s:bundle = neobundle#get("vimshell")
function! s:bundle.hooks.on_source(bundle)
  let g:vimshell_prompt = '$ '
endfunction
unlet s:bundle

nnoremap <Space>vs :VimShell<CR>
"}}}

" quickrun"{{{
let s:bundle = neobundle#get("vim-quickrun")
function! s:bundle.hooks.on_source(bundle)
  " let b:quickrun_config = {'outputter/buffer/into': 1}
  let g:quickrun_config = {}
  let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s'], 'into': 0}
  let g:quickrun_config['ruby'] = {'command' : 'ruby', 'into': 0}
  let g:quickrun_config['slim'] = {'command' : 'slimrb', 'exec' : ['%c -p %s'], 'into': 0}
endfunction
unlet s:bundle

nmap <silent> <Leader>r <Plug>(quickrun)
"}}}

" vim-ref"{{{
let s:bundle = neobundle#get('vim-ref')
function! s:bundle.hooks.on_source(bundle)
  let g:ref_refe_cmd = $HOME."/rubyref/refe-1_9_3"
  if has('win32')
    let g:ref_refe_encoding = 'cp932'
  else
    let g:ref_refe_encoding = 'utf-8'
  endif
  let g:ref_use_vimproc = 1
  let g:ref_open = 'vsplit'

  autocmd MyAutoCmd FileType ref call s:initialize_ref_viewer()
  function! s:initialize_ref_viewer()
    nmap <buffer> b <Plug>(ref-back)
    nmap <buffer> f <Plug>(ref-forward)
    nmap <buffer> <C-t>  :tabnew<CR>
    nnoremap <buffer> q <C-w>c
    setlocal nonumber
  endfunction
endfunction
unlet s:bundle

nmap ,rr :<C-u>Ref refe<Space>
"}}}

" fugitive"{{{
nnoremap <Space>gd :<C-u>Gdiff<Enter>
nnoremap <Space>gs :<C-u>Gstatus<Enter>
nnoremap <Space>gl :<C-u>Glog<Enter>
nnoremap <Space>ga :<C-u>Gwrite<Enter>
nnoremap <Space>gc :<C-u>Gcommit<Enter>
nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
nnoremap <Space>gb :<C-u>Gblame<Enter>
"}}}

" emmet snippets"{{{
let g:user_emmet_settings = {
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
\              ."<script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js\"></script>\n"
\              ."</body>\n"
\              ."</html>",
\    }
\  }
\}
"}}}

" matchit.vim"{{{
source $VIMRUNTIME/macros/matchit.vim
"}}}

" memolist"{{{
let s:bundle = neobundle#get("memolist.vim")
function! s:bundle.hooks.on_source(bundle)
  let g:memolist_vimfiler = 1
  let g:memolist_vimfiler_option = ""
endfunction
unlet s:bundle

map ,mn  :MemoNew<CR>
map ,ml  :MemoList<CR>
map ,mg  :MemoGrep<CR>
"}}}

au! MyAutoCmd FileType scss syntax cluster sassCssAttributes add=@cssColors
autocmd MyAutoCmd BufNewFile,BufRead *_spec.rb set filetype=ruby.rspec

" Edit .vimrc .gvimc"{{{
nnoremap <silent> <Space>ev  :<C-u>edit $HOME/dotfiles/.vimrc<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $HOME/dotfiles/.gvimrc<CR>
" Load .gvimrc after .vimrc edited at GVim.
nnoremap <silent> <F5> :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <F4> :<C-u>source $MYGVIMRC<CR>
"}}}

let g:netrw_localcopycmd = ''

" エンコーディングutf-8を優先する"{{{
let &fileencodings=substitute(substitute(&fileencodings, ',\?utf-8', '', 'g'), 'cp932', 'utf-8,cp932', '')
"}}}
