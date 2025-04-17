vim.opt.backspace = "indent,eol,start"
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.cmdwinheight = 8
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.cursorline = true
vim.opt.diffopt = "internal,algorithm:patience,indent-heuristic"
vim.opt.formatoptions:append "mM"
vim.opt.helpheight = 30
vim.opt.hidden = true
vim.opt.history = 500
vim.opt.mouse = "a"
vim.opt.nrformats = "alpha,octal,hex"
vim.opt.number = true
vim.opt.pumblend = 20
vim.opt.pumheight = 15
vim.opt.ruler = true
vim.opt.scrolloff = 5
vim.opt.shortmess = "aTI"
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.signcolumn = "auto"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.textwidth = 0
vim.opt.title = true
vim.opt.updatetime = 300
vim.opt.virtualedit = "block"
vim.opt.winblend = 20
vim.opt.winborder = "rounded"
vim.opt.writebackup = false

-- Tab, indent
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 4

vim.opt.list = true
vim.opt.listchars = "tab:»·,trail:·,extends:→,precedes:←"

-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.wrapscan = true

-- Fold
vim.opt.foldcolumn = "0"
vim.opt.foldenable = true
vim.opt.foldmethod = "marker"

-- Statusline
vim.opt.laststatus = 3
vim.opt.statusline = "%!v:lua.require('core.statusline').setup()"
