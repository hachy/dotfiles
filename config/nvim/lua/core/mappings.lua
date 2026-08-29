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
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

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

-- Auto-close angle brackets `<>` and handle deletion in insert mode
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

-- Toggle boolean values (true/false) or fallback to incrementing numbers
local function toggle_boolean()
  local word = vim.fn.expand "<cword>"
  local toggles = {
    ["true"] = "false",
    ["True"] = "False",
  }
  local replacement = toggles[word]
    or (function()
      for k, v in pairs(toggles) do
        if word == v then
          return k
        end
      end
    end)()

  if replacement then
    vim.cmd('normal! "_ciw' .. replacement)
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-a>", true, false, true), "n", true)
  end
end

vim.keymap.set("n", "<C-a>", toggle_boolean, { noremap = true })

-- MemoNew command
local memo_dir = vim.fn.expand "~/Dropbox/memo/"

vim.api.nvim_create_user_command("MemoNew", function(opts)
  local title = opts.args

  if vim.fn.isdirectory(memo_dir) == 0 then
    vim.notify("Directory does not exist: " .. memo_dir, vim.log.levels.WARN)
    return
  end

  local file_path = memo_dir .. title .. ".md"
  vim.cmd("edit " .. vim.fn.fnameescape(file_path))
end, { nargs = 1 })

vim.keymap.set("n", "<Space>mn", ":MemoNew ", { desc = "Create new memo" })
