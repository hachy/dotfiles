require("cmdpalette").setup {
  buf = {
    filetype = "cmdpalette",
  },
}

vim.keymap.set("n", ":", "<Plug>(cmdpalette)")

local cmdpalette = vim.api.nvim_create_augroup("cmdpalette", { clear = false })
vim.api.nvim_create_autocmd("BufEnter", {
  group = cmdpalette,
  pattern = { "cmdpalette" },
  callback = function()
    vim.cmd.inoreabbrev("h", "tab help")
  end,
})

vim.api.nvim_create_autocmd("BufLeave", {
  group = cmdpalette,
  pattern = "cmdpalette",
  callback = function()
    vim.cmd.iunabbrev "h"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = cmdpalette,
  pattern = "cmdpalette",
  callback = function(args)
    vim.bo[args.buf].autocomplete = false
  end,
})
