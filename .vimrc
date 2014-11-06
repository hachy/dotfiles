set nocompatible

set runtimepath+=$HOME/.vim,$HOME/.vim/after

augroup MyAutoCmd
  autocmd!
augroup END

" neobundle"{{{
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundleLazy 'Shougo/unite.vim', {
      \ 'autoload' : {
      \   'commands' : [{ 'name' : 'Unite',
      \                   'complete' : 'customlist,unite#complete_source'}]
      \ }}

NeoBundle 'Shougo/neomru.vim'

NeoBundleLazy 'Shougo/vimfiler.vim', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \    'commands' : [{ 'name' : 'VimFiler',
      \                    'complete' : 'customlist,vimfiler#complete' },
      \                  'VimFilerExplorer'],
      \    'mappings' : ['<Plug>(vimfiler_'],
      \    'explorer' : 1,
      \ }}

NeoBundleLazy 'Shougo/vimshell.vim',{
      \ 'depends' : 'Shougo/vimproc.vim',
      \ 'autoload' : {
      \   'commands' : [{ 'name' : 'VimShell',
      \                   'complete' : 'customlist,vimshell#complete'},
      \                 'VimShellExecute', 'VimShellInteractive',
      \                 'VimShellTerminal', 'VimShellPop'],
      \   'mappings' : ['<Plug>(vimshell_']
      \ }}

NeoBundleLazy 'Shougo/neocomplete.vim', {
      \ 'autoload' : {
      \   'insert' : 1
      \ }}

NeoBundleLazy 'Shougo/neosnippet.vim', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ }}

NeoBundleLazy 'thinca/vim-quickrun', {
      \ 'mappings' : '<Plug>(quickrun)'
      \ }

NeoBundleLazy 'thinca/vim-ref', {
      \ 'commands' : 'Ref',
      \ 'filetypes' : ['ruby']
      \ }

NeoBundleLazy 'h1mesuke/unite-outline', {
      \ 'unite_sources' : 'outline',
      \ }

NeoBundleLazy 'mattn/emmet-vim', {
      \ 'filetypes': ['html', 'haml', 'eruby'],
      \ }

NeoBundleLazy 'ap/vim-css-color', {
      \ 'filetypes' : ['css', 'scss']
      \ }

NeoBundleLazy 'pangloss/vim-javascript', {
      \ 'filetypes' : 'javascript'
      \ }

NeoBundleLazy 'kchmck/vim-coffee-script', {
      \ 'filetypes' : 'coffee'
      \ }

NeoBundleLazy 'glidenote/memolist.vim', {
      \ 'commands' : ['MemoNew', 'MemoList', 'MemoGrep']
      \ }

NeoBundleLazy 'yuratomo/w3m.vim', {
      \ 'commands' : ['W3m', 'W3mHistory']
      \ }

NeoBundleLazy 'vim-jp/vimdoc-ja', {
      \ 'filetypes' : 'help',
      \ }

NeoBundle 'hachy/eva01.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tomtom/tcomment_vim'

call neobundle#end()

filetype plugin indent on     " Required!

" Installation check.
NeoBundleCheck
"}}}

" Basic"{{{
set encoding=utf-8

if has("syntax")
  syntax on
endif
set ruler
set cursorline
set title
set number
set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set smartindent
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

set splitright
set splitbelow

set clipboard=unnamedplus,autoselect

" neosnippet で変なの出さない
set completeopt-=preview

set helpheight=30

set pastetoggle=<F10>
autocmd MyAutoCmd InsertLeave * set nopaste

" set colorcolumn=85
"}}}

" Color"{{{
set t_Co=256
set background=dark
colorscheme eva01
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
" # == *
nmap # *zz
nmap g* g*zz
nmap g# g#zz
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
inoremap <C-d> <Del>
inoremap <silent><C-a> <C-o>^

" command-line mode
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

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

" preview current html file
nnoremap <Leader>W :silent !xdg-open %:p &<CR>
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
  call unite#custom#profile('default', 'context', {
        \ 'winwidth': 35,
        \ 'winheight': 15,
        \ 'direction': 'botright',
        \ })

  autocmd MyAutoCmd FileType unite call s:unite_my_settings()
  function! s:unite_my_settings()
    nmap <silent><buffer> <Esc><Esc> q
    imap <silent><buffer> <Esc><Esc> <Esc>q
  endfunction
endfunction
unlet s:bundle

nnoremap <silent> ,uf :<C-u>Unite file<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,uo :<C-u>Unite -vertical -no-quit outline<CR>
nnoremap <silent> ,ur :<C-u>Unite history/yank -buffer-name=register register<CR>
nnoremap <silent> ,ug :<C-u>Unite -no-quit grep<CR>
"}}}

" neocomplete.vim"{{{
let g:neocomplete#enable_at_startup = 1

let s:bundle = neobundle#get("neocomplete.vim")
function! s:bundle.hooks.on_source(bundle)
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 3

  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
  endfunction

  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
endfunction
unlet s:bundle
"}}}

" neosnippet.vim"{{{
let s:bundle = neobundle#get("neosnippet.vim")
function! s:bundle.hooks.on_source(bundle)
  " Keymappings for neosnippet
  imap <C-o> <Plug>(neosnippet_expand_or_jump)
  smap <C-o> <Plug>(neosnippet_expand_or_jump)
  " Define directory
  let g:neosnippet#snippets_directory = $HOME.'/.vim/snippets'
  let g:neosnippet#disable_runtime_snippets = {
        \   'c' : 1
        \ }
endfunction
unlet s:bundle
"}}}

" vimfiler.vim"{{{
let g:vimfiler_data_directory= $HOME.'/.tmp/.vimfiler'
let s:bundle = neobundle#get("vimfiler.vim")
function! s:bundle.hooks.on_source(bundle)
  let g:vimfiler_as_default_explorer = 1
  call vimfiler#custom#profile('default', 'context', {
        \ 'safe' : 0,
        \ 'edit_action' : 'tabopen',
        \ })

  autocmd MyAutoCmd FileType vimfiler nmap <buffer> o <Plug>(vimfiler_sync_with_current_vimfiler)
endfunction
unlet s:bundle

nnoremap <Space>vf :<C-u>VimFiler -status<CR>
"}}}

" vimshell.vim"{{{
let g:vimshell_temporary_directory = $HOME.'/.tmp/.vimshell'
let s:bundle = neobundle#get("vimshell.vim")
function! s:bundle.hooks.on_source(bundle)
  let g:vimshell_prompt = '$ '
endfunction
unlet s:bundle

nnoremap <Space>vs :VimShell<CR>
"}}}

" vim-quickrun"{{{
let s:bundle = neobundle#get("vim-quickrun")
function! s:bundle.hooks.on_source(bundle)
  let g:quickrun_config = {}
  let g:quickrun_config.coffee = {'command' : 'coffee', 'exec' : '%c -cbp %s'}
  let g:quickrun_config.ruby = {'command' : 'ruby'}
  let g:quickrun_config.slim = {'command' : 'slimrb', 'exec' : '%c -p %s'}
  let g:quickrun_config.markdown = {
        \ 'runner' : 'vimproc',
        \ 'outputter' : 'null',
        \ 'command' : 'nw',
        \ 'args' : '~/Dev/premark.nw',
        \ 'exec' : '%c %a %s',
        \ }
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

nnoremap ,rr :<C-u>Ref refe<Space>
"}}}

" fugitive"{{{
nnoremap <Space>gd :<C-u>Gvdiff<Enter>
nnoremap <Space>gs :<C-u>Gstatus<Enter>
nnoremap <Space>gl :<C-u>Glog<Enter>
nnoremap <Space>gb :<C-u>Gblame<Enter>
"}}}

" emmet-vim"{{{
let s:bundle = neobundle#get("emmet-vim")
function! s:bundle.hooks.on_source(bundle)
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
endfunction
unlet s:bundle
"}}}

" matchit.vim"{{{
source $VIMRUNTIME/macros/matchit.vim
"}}}

" memolist.vim "{{{
let s:bundle = neobundle#get("memolist.vim")
function! s:bundle.hooks.on_source(bundle)
  let g:memolist_unite = 1
  let g:memolist_memo_date = '%Y-%m-%d'
  let g:memolist_memo_suffix = 'markdown'
  let g:memolist_path = $HOME.'/Dropbox/memo'
  let g:memolist_template_dir_path = '~/.vim/template'
endfunction
unlet s:bundle

map ,mn  :MemoNew<CR>
map ,ml  :MemoList<CR>
map ,mg  :MemoGrep<CR>
"}}}

" syntastic"{{{
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
"}}}

" au! MyAutoCmd FileType scss syntax cluster sassCssAttributes add=@cssColors
autocmd MyAutoCmd BufNewFile,BufRead *_spec.rb set filetype=ruby.rspec
autocmd MyAutoCmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
  exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
  " set completeopt=menu,preview
endif

autocmd MyAutoCmd BufNewFile,BufRead *.go set filetype=go
autocmd MyAutoCmd BufWritePre *.go Fmt

let g:markdown_fenced_languages = ['ruby']

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
