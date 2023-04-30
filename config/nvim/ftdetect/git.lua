vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*/config/git/config",
  callback = function()
    vim.bo.filetype = "gitconfig"
  end,
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*/config/git/ignore",
  callback = function()
    vim.bo.filetype = "gitignore"
  end,
})
