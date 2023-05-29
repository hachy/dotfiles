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
