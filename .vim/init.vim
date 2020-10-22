set runtimepath+=$XDG_CONFIG_HOME/nvim/,$XDG_CONFIG_HOME/nvim/after

augroup MyAutoCmd
  autocmd!
augroup END

" vim-plug"{{{
if has('vim_starting')
  set runtimepath+=~/.config/nvim/bundle/vim-plug
endif

call plug#begin('~/.config/nvim/bundle')
Plug 'junegunn/vim-plug',
      \ {'dir': '~/.config/nvim/bundle/vim-plug/autoload'}
Plug 'hachy/eva01.vim'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'thinca/vim-quickrun'
Plug 'mattn/emmet-vim', { 'for': ['html', 'haml', 'eruby'] }
Plug 'glidenote/memolist.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tomtom/tcomment_vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'mattn/vim-goimports'
Plug 'vim-jp/vimdoc-ja', { 'for': 'help' }
call plug#end()
"}}}

filetype plugin indent on

" Basic"{{{
if has("syntax")
  syntax on
endif
set hidden
set imdisable
set ruler
set title
set number
set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set smartindent
set breakindent
set showmatch
set showcmd
set cmdheight=2
set cmdwinheight=8
set pumheight=15
set pumblend=10
set history=200
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«
set backspace=indent,eol,start
set mouse=a
set shortmess=aTI
set formatoptions+=mM
set nrformats=alpha,octal,hex
" Folding
set foldenable
set foldmethod=marker
set foldcolumn=0
autocmd MyAutoCmd FileType vim setlocal foldcolumn=2
" No backups
set nobackup
set nowritebackup
set noswapfile
" Move the cursor to positions where there isn't any text
set virtualedit=block
set textwidth=0
set scrolloff=5
set splitright
set splitbelow
set updatetime=300
set signcolumn=yes

if has('unnamedplus')
  set clipboard& clipboard+=unnamedplus
else
  set clipboard& clipboard+=unnamed
endif

set completeopt=menu,noselect
set helpheight=30

set pastetoggle=<F10>
autocmd MyAutoCmd InsertLeave * set nopaste
"}}}

" Color"{{{
set background=dark
set termguicolors
colorscheme eva01-LCL
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
nnoremap <C-h> <Home>
vnoremap <C-h> <Home>
nnoremap <C-l> <End>
vnoremap <C-l> <End>

inoremap <silent><expr><C-h> pumvisible() ? "\<C-y>\<Left>" : "\<Left>"
inoremap <silent><expr><C-j> pumvisible() ? "\<C-y>\<Down>" : "\<Down>"
inoremap <silent><expr><C-k> pumvisible() ? "\<C-y>\<Up>" : "\<Up>"
inoremap <silent><expr><C-l> pumvisible() ? "\<C-y>\<Right>" : "\<Right>"

inoremap <C-a> <Home>
inoremap <C-b> <Left>
inoremap <C-d> <Del>
inoremap <C-e> <End>
inoremap <C-f> <Right>
inoremap <C-n> <Down>
inoremap <C-p> <Up>

cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

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
" Visual mode で検索
vnoremap <silent> # "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

xnoremap p "_dP
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
  inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  setl nonumber
  setl signcolumn=no
  startinsert!
endfunction
"}}}

" fzf{{{
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git'"
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <SPACE>b :Buffers<CR>
nnoremap <silent> <SPACE>h :History<CR>
"}}}

" defx.nvim{{{
autocmd MyAutoCmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
        \ defx#do_action('open')
  nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
        \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
        \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
        \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
        \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> t
        \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
        \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
        \ defx#do_action('toggle_columns',
        \                'mark:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
        \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> D
        \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> R
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
        \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
        \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
        \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
        \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
        \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
        \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
        \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
        \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
        \ defx#do_action('change_vim_cwd')
endfunction

call defx#custom#column('filename', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ 'min_width': 40,
      \ 'max_width': 40,
      \ })
call defx#custom#column('mark', {
      \ 'readonly_icon': '✗',
      \ 'selected_icon': '✓',
      \ })
call defx#custom#option('_', {
      \ 'columns': 'mark:indent:icon:filename:type:size:time',
      \ })

nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
nnoremap <silent><Space>f :<C-u>Defx -listed -resume -buffer-name=tab`tabpagenr()`<CR>
"}}}

" neosnippet.vim"{{{
imap <C-o> <Plug>(neosnippet_expand_or_jump)
smap <C-o> <Plug>(neosnippet_expand_or_jump)
" Define directory
let g:neosnippet#snippets_directory = $HOME.'/dotfiles/.vim/snippets'
let g:neosnippet#disable_runtime_snippets = {
      \   'c' : 1
      \ }
"}}}

" vim-quickrun"{{{
let g:quickrun_config = {}
let g:quickrun_config._ = {
      \ 'split' : '%{winwidth(0) * 1.5 < winheight(0) * 5 ? "botright 8" : "vertical 80"}'
      \ }
let g:quickrun_config.ruby = {'command' : 'ruby'}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'exec': 'bundle exec %c %o', 'cmdopt': '-f d --color'}
let g:quickrun_config.cpp = { 'cmdopt': '-std=c++11' }

nnoremap <silent> <Leader>q :<C-u>bw! \[quickrun\ output\]<CR>
autocmd MyAutoCmd FileType quickrun nnoremap <silent><buffer>q :quit<CR>
"}}}

" fugitive"{{{
nnoremap <Space>gd :<C-u>Gvdiff<Enter>
nnoremap <Space>gs :<C-u>Gstatus<Enter>
nnoremap <Space>gl :<C-u>Glog<Enter>
nnoremap <Space>gb :<C-u>Gblame<Enter>
"}}}

" vim-gitgutter{{{
autocmd MyAutoCmd BufWritePost * GitGutter
"}}}

" matchit.vim"{{{
if !exists('g:loaded_matchit')
  runtime macros/matchit.vim
endif
"}}}

" memolist.vim "{{{
let g:memolist_fzf = 1
let g:memolist_memo_date = '%Y-%m-%d'
let g:memolist_memo_suffix = 'markdown'
let g:memolist_path = $HOME.'/Dropbox/memo'
let g:memolist_template_dir_path = '~/.vim/template'

map ,mn  :MemoNew<CR>
map ,ml  :MemoList<CR>
map ,mg  :MemoGrep<CR>
"}}}

" ale{{{
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'typescript': ['eslint', 'tsserver'],
      \}
let g:ale_fixers = {
      \ 'css': ['stylelint'],
      \ 'scss': ['stylelint'],
      \ 'javascript': ['eslint'],
      \ 'typescript': ['eslint'],
      \ 'ruby': ['rubocop'],
      \}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"
"}}}

" vim-prettier{{{
let g:prettier#autoformat = 0
autocmd MyAutoCmd BufWritePre *.css,*.scss,*.graphql,*.vue,*.yaml,*.html PrettierAsync
"}}}

autocmd MyAutoCmd BufNewFile,BufRead *_spec.rb set filetype=ruby.rspec
autocmd MyAutoCmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
autocmd MyAutoCmd BufNewFile,BufRead *.{ruby,jbuilder} set filetype=ruby
autocmd MyAutoCmd BufNewFile,BufRead *.vue setlocal filetype=vue.html.javascript.css

let g:markdown_fenced_languages = ['ruby']

" Edit init.vim"{{{
nnoremap <silent> <Space>ev  :<C-u>edit $HOME/dotfiles/.vim/init.vim<CR>
nnoremap <silent> <F5> :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
"}}}

" help{{{
autocmd MyAutoCmd CmdwinEnter * noreabbrev h tab help
autocmd MyAutoCmd CmdwinLeave * unabbrev h
" Close help by pressing q.
autocmd MyAutoCmd FileType help nnoremap <buffer> q <C-w>c
"}}}

let g:netrw_localcopycmd = ''

" エンコーディングutf-8を優先する"{{{
let &fileencodings=substitute(substitute(&fileencodings, ',\?utf-8', '', 'g'), 'cp932', 'utf-8,cp932', '')
"}}}
