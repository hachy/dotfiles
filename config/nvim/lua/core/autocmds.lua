local myautocmd = vim.api.nvim_create_augroup("MyAutoCmd", { clear = true })

vim.api.nvim_create_autocmd("InsertLeave", {
  group = myautocmd,
  pattern = "*",
  command = "set nopaste",
})

vim.api.nvim_create_autocmd("FileType", {
  group = myautocmd,
  pattern = "help",
  callback = function()
    vim.keymap.set("n", "q", "<C-w>c", { buffer = true })
  end,
  desc = " Close help by pressing q.",
})

vim.api.nvim_create_autocmd("FileType", {
  group = myautocmd,
  pattern = "*",
  command = "setlocal formatoptions-=ro",
  desc = "disable auto-commenting new lines after hitting Enter on commented line",
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = myautocmd,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 300 }
  end,
  desc = "Highlight text after yank",
})

vim.api.nvim_create_autocmd("FileType", {
  group = myautocmd,
  pattern = "gdscript",
  callback = function()
    vim.keymap.set("n", "<F5>", function()
      vim.fn.system { "godot", "-d" }
    end, {})
  end,
})
