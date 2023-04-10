vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { ".stylelintrc" },
  command = "setfiletype json",
})
