local id = vim.api.nvim_create_augroup("MyGroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { ".stylelintrc" },
  command = "setfiletype json",
  group = id,
})
