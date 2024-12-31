vim.g.mapleader = "¥"

-- Tab page
vim.keymap.set("n", "<C-Tab>", "<Cmd>tabnext<CR>")
vim.keymap.set("i", "<C-Tab>", "<Esc><Cmd>tabnext<CR>")
vim.keymap.set("n", "<C-S-Tab>", "<Cmd>tabprevious<CR>")
vim.keymap.set("i", "<C-S-Tab>", "<Esc>:tabprevious<CR>")
vim.keymap.set("n", "<C-t>", "<Cmd>tabnew<CR>")

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

vim.keymap.set("n", "<Space>ev", "<Cmd>edit $MYVIMRC<CR>", { silent = true })

vim.keymap.set("n", "[b", vim.cmd.bprevious)
vim.keymap.set("n", "]b", vim.cmd.bnext)

vim.keymap.set("i", "<", function()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  if line:sub(col, col) == "<" then
    if line:sub(col + 1, col + 1) == ">" then
      return "<<Del>"
    else
      return "<"
    end
  end
  return "<>" .. "<C-G>U<Left>"
end, { noremap = true, expr = true })

-- cmdpalette
vim.keymap.set("n", ":", "<Plug>(cmdpalette)")

-- nvf
vim.keymap.set("n", "<Space>f", "<Cmd>Nvf<CR>")

-- recmdwin
vim.keymap.set("n", ";", "q:")

-- fzf
vim.keymap.set("n", "<C-p>", "<Cmd>Files<CR>", { silent = true })
vim.keymap.set("n", "<Space>b", "<Cmd>Buffers<CR>", { silent = true })
vim.keymap.set("n", "<Space>G", "<Cmd>Rg<CR>", { silent = true })
vim.keymap.set("n", "<Space>h", "<Cmd>FZFMru<CR>", { silent = true })

-- quickrun
vim.keymap.set("n", "<Leader>q", "<Cmd>bw! quickrun://output<CR>", { silent = true })
vim.keymap.set("n", "<Leader>r", "<Plug>(quickrun)", { remap = true, silent = true })

-- memolist
vim.keymap.set("n", "<Space>mn", "<Cmd>MemoNew<CR>")
vim.keymap.set("n", "<Space>ml", "<Cmd>MemoList<CR>")
vim.keymap.set("n", "<Space>mg", "<Cmd>MemoGrep<CR>")

-- fugitive
vim.keymap.set("n", "<Space>gd", "<Cmd>Gvdiffsplit<CR>")
vim.keymap.set("n", "<Space>gs", "<Cmd>Git<CR>")
