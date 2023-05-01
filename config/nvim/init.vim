set encoding=utf-8
scriptencoding utf-8
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
Plug 'hachy/cmdpalette.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mhartington/formatter.nvim'
Plug 'mfussenegger/nvim-lint'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'notomo/cmp-neosnippet'
Plug 'ray-x/lsp_signature.nvim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'thinca/vim-quickrun'
Plug 'mattn/emmet-vim', { 'for': ['html', 'haml', 'eruby'] }
Plug 'glidenote/memolist.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kylechui/nvim-surround'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'NvChad/nvim-colorizer.lua'
call plug#end()
"}}}

filetype plugin indent on

" Basic"{{{
if has('syntax')
  syntax on
endif
set hidden
set imdisable
set ruler
set title
set number
set cursorline
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
set cmdheight=1
set cmdwinheight=8
set pumheight=15
set pumblend=20
set winblend=20
set history=500
set list
set listchars=tab:»·,trail:·,extends:→,precedes:←
set backspace=indent,eol,start
set mouse=a
set shortmess=aTI
set formatoptions+=mM
set nrformats=alpha,octal,hex
" Folding
set foldenable
set foldmethod=marker
set foldcolumn=0
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
set signcolumn=auto

if has('unnamedplus')
  set clipboard& clipboard+=unnamedplus
else
  set clipboard& clipboard+=unnamed
endif

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
nnoremap <C-Tab>   :<C-u>tabnext<CR>
inoremap <C-Tab>   <Esc>:tabnext<CR>
nnoremap <C-S-Tab> :<C-u>tabprevious<CR>
inoremap <C-S-Tab> <Esc>:tabprevious<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
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
set laststatus=3
set statusline=%<\%F\ %y%m%r%=%{fugitive#statusline()}\ %{''.(&fenc!=''?&fenc:&enc).''}\%{(&bomb?\",BOM\":\"\")}\ %{&ff}\ %3p%%\ [%4l:%3c]
"}}}

" Keymappings"{{{
nnoremap [b :bnext<cr>
nnoremap ]b :bprev<cr>

nnoremap <C-h> <Home>
vnoremap <C-h> <Home>
nnoremap <C-l> <End>
vnoremap <C-l> <End>

inoremap <silent><expr><C-h> pumvisible() ? "\<C-y>\<Left>" : "\<Left>"
inoremap <silent><expr><C-j> pumvisible() ? "\<C-y>\<Down>" : "\<Down>"
inoremap <silent><expr><C-k> pumvisible() ? "\<C-y>"        : "\<Up>"
inoremap <silent><expr><C-l> pumvisible() ? "\<C-y>"        : "\<Right>"

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

" Enter == o
nnoremap <CR> o<Esc>
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

xnoremap p "_dP
"}}}

" complement{{{
set completeopt=menuone,noinsert,noselect
inoremap <expr><CR>    pumvisible() ? "<C-y>"   : "<CR>"
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
"}}}

" fzf{{{
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git'"
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let g:fzf_preview_window = ['down,50%', 'ctrl-/']

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <SPACE>b :Buffers<CR>
nnoremap <silent> <SPACE>G :Rg<CR>
"}}}

" fzf-mru{{{
nnoremap <silent> <SPACE>h :FZFMru<CR>
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

call defx#custom#column('icon', {
      \ 'directory_icon': '▸ ',
      \ 'file_icon': '  ',
      \ 'opened_icon': '▾ ',
      \ 'root_icon': '  ',
      \ })
call defx#custom#column('mark', {
      \ 'readonly_icon': '✗',
      \ 'selected_icon': '✓',
      \ })
call defx#custom#option('_', {
      \ 'columns': 'mark:indent:icon:filename:type:size:time',
      \ })

nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
nnoremap <silent><Space>f :<C-u>Defx -listed -resume<CR>
"}}}

" neosnippet.vim"{{{
imap <C-o> <Plug>(neosnippet_expand_or_jump)
smap <C-o> <Plug>(neosnippet_expand_or_jump)
" Define directory
let g:neosnippet#snippets_directory = $HOME.'/dotfiles/config/nvim/snippets'
let g:neosnippet#disable_runtime_snippets = {
      \   'c' : 1
      \ }
"}}}

" vim-quickrun"{{{
let g:quickrun_config = {}
let g:quickrun_config._ = {}
let g:quickrun_config._['outputter/buffer/opener'] ='%{winwidth(0) >= 100 ? "vnew" : "15new"}'
let g:quickrun_config.ruby = {'command' : 'ruby'}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'exec': 'bundle exec %c %o', 'cmdopt': '-f d --color'}
let g:quickrun_config.cpp = { 'cmdopt': '-std=c++11' }
let g:quickrun_config.rust = {'exec' : 'cargo run'}

nnoremap <silent> <Leader>q :<C-u>bw! quickrun://output<CR>
autocmd MyAutoCmd FileType quickrun nnoremap <silent><buffer>q :quit<CR>
nmap <silent> <Leader>r <Plug>(quickrun)
"}}}

" fugitive"{{{
nnoremap <Space>gd :<C-u>Gvdiffsplit<Enter>
nnoremap <Space>gs :<C-u>Git<Enter>
"}}}

" memolist.vim "{{{
let g:memolist_fzf = 1
let g:memolist_memo_date = '%Y-%m-%d'
let g:memolist_memo_suffix = 'markdown'
let g:memolist_path = $HOME.'/Dropbox/memo'
let g:memolist_template_dir_path = '~/config/nvim/template'

map ,mn  :MemoNew<CR>
map ,ml  :MemoList<CR>
map ,mg  :MemoGrep<CR>
"}}}

" Edit init.vim"{{{
nnoremap <silent> <Space>ev  :<C-u>edit $HOME/dotfiles/config/nvim/init.vim<CR>
nnoremap <silent> <F5> :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
"}}}

" help{{{
autocmd MyAutoCmd CmdwinEnter * noreabbrev h tab help
autocmd MyAutoCmd CmdwinLeave * unabbrev h
" Close help by pressing q.
autocmd MyAutoCmd FileType help nnoremap <buffer> q <C-w>c
"}}}

lua <<EOF
require "plugins.nvim-lspconfig"
require "plugins.treesitter"
require "plugins.formatter"
require "plugins.nvim-lint"
require "plugins.nvim-cmp"
require "plugins.cmdpalette"
require "plugins.indent-blankline"
require("nvim-surround").setup {}
require("Comment").setup {}
require("gitsigns").setup {}
require("lsp_signature").setup {}
require("lsp_signature").on_attach()
require("colorizer").setup {}
EOF
