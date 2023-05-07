-- Tab page
vim.keymap.set("n", "<C-Tab>", "<Cmd>tabnext<CR>")
vim.keymap.set("i", "<C-Tab>", "<Esc><Cmd>tabnext<CR>")
vim.keymap.set("n", "<C-S-Tab>", "<Cmd>tabprevious<CR>")
vim.keymap.set("i", "<C-S-Tab>", "<Esc>:tabprevious<CR>")
vim.keymap.set("n", "<C-t>", "<Cmd>tabnew<CR>")
vim.keymap.set("i", "<C-t>", "<Esc><Cmd>tabnew<CR>")

-- Search
vim.keymap.set("n", "<Esc><Esc>", "<Cmd>set nohlsearch<CR>")
vim.keymap.set("n", "/", "<Cmd>set hlsearch<CR>/")
vim.keymap.set("n", "?", "<Cmd>set hlsearch<CR>?")
vim.keymap.set("n", "*", "<Cmd>set hlsearch<CR>*")
vim.keymap.set("n", "#", "<Cmd>set hlsearch<CR>#")
vim.keymap.set("n", "#", "*", { remap = true })

vim.keymap.set({ "n", "v" }, "<C-h>", "<Home>")
vim.keymap.set({ "n", "v" }, "<C-l>", "<End>")

-- hjkl in insert mode
vim.keymap.set("i", "<C-h>", function()
  return vim.fn.pumvisible == 1 and "<Left>" or "<Left>"
end, { expr = true, silent = true })
vim.keymap.set("i", "<C-j>", function()
  return vim.fn.pumvisible == 1 and "<Down>" or "<Down>"
end, { expr = true, silent = true })
vim.keymap.set("i", "<C-k>", function()
  return vim.fn.pumvisible == 1 and "<C-y>" or "<Up>"
end, { expr = true, silent = true })
vim.keymap.set("i", "<C-l>", function()
  return vim.fn.pumvisible == 1 and "<C-y>" or "<Right>"
end, { expr = true, silent = true })

vim.keymap.set({ "i", "c" }, "<C-a>", "<Home>")
vim.keymap.set({ "i", "c" }, "<C-b>", "<Left>")
vim.keymap.set({ "i", "c" }, "<C-d>", "<Del>")
vim.keymap.set({ "i", "c" }, "<C-e>", "<End>")
vim.keymap.set({ "i", "c" }, "<C-f>", "<Right>")
vim.keymap.set({ "i", "c" }, "<C-n>", "<Down>")
vim.keymap.set({ "i", "c" }, "<C-p>", "<Up>")

vim.keymap.set("n", "<CR>", "o<Esc>")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set({ "i", "n", "v" }, "<F1>", "<Esc>")

vim.keymap.set("n", "ZZ", "<Nop>")
vim.keymap.set("n", "Q", "<Nop>")
vim.keymap.set("n", "q", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<C-z>", "<Nop>")

vim.keymap.set("x", "p", "P")
