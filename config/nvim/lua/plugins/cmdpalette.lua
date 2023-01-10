require("cmdpalette").setup {
  buf = {
    filetype = "cmdpalette",
  },
}

vim.keymap.set("n", ":", "<Cmd>Cmdpalette<CR>")

local cmdpalette = vim.api.nvim_create_augroup("cmdpalette", { clear = false })
vim.api.nvim_create_autocmd("BufEnter", {
  group = cmdpalette,
  pattern = { "cmdpalette" },
  callback = function()
    vim.cmd [[noreabbrev h tab help]]
  end,
})

vim.api.nvim_create_autocmd("BufLeave", {
  group = cmdpalette,
  pattern = "cmdpalette",
  callback = function()
    vim.cmd [[unabbrev h]]
  end,
})
