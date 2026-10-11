vim.opt.backspace = "indent,eol,start"
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.cmdwinheight = 8
vim.opt.cursorline = true
vim.opt.diffopt = "internal,algorithm:patience,indent-heuristic"
vim.opt.formatoptions:append "mM"
vim.opt.helpheight = 30
vim.opt.hidden = true
vim.opt.history = 500
vim.opt.mouse = "a"
vim.opt.mousemodel = "popup"
vim.opt.nrformats = "alpha,octal,hex"
vim.opt.number = true
vim.opt.pumblend = 0
vim.opt.pumborder = "rounded"
vim.opt.pumheight = 15
vim.opt.ruler = true
vim.opt.scrolloff = 10
vim.opt.shortmess = "aT"
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
vim.opt.wildmode = "longest:full,full"
vim.opt.virtualedit = "block"
vim.opt.winbar = "%f"
vim.opt.winblend = 0
vim.opt.winborder = "rounded"
vim.opt.writebackup = false

-- Completion
vim.o.autocomplete = true
vim.o.complete = ".,o"
vim.opt.completeopt = "menu,menuone,noinsert,noselect,popup,fuzzy"

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
vim.opt.listchars = {
  tab = "»·",
  trail = "·",
  extends = "→",
  precedes = "←",
}

local function update_lead()
  local tabstop = vim.bo.tabstop
  local lead = "¦" .. string.rep(" ", tabstop - 1)
  vim.opt_local.listchars:append { leadmultispace = lead }
end

vim.api.nvim_create_autocmd("OptionSet", {
  pattern = { "tabstop", "shiftwidth" },
  callback = update_lead,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = update_lead,
})

-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.wrapscan = true

-- Fold
vim.opt.foldcolumn = "0"
vim.opt.foldenable = true
vim.opt.foldmethod = "manual"
vim.opt.foldlevel = 99

-- Statusline
vim.opt.laststatus = 3
vim.opt.statusline = "%!v:lua.require('core.statusline').setup()"
