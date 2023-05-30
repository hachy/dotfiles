require("cmdpalette").setup {
  buf = {
    filetype = "cmdpalette",
  },
}

local cmdpalette = vim.api.nvim_create_augroup("cmdpalette", { clear = false })
vim.api.nvim_create_autocmd("BufEnter", {
  group = cmdpalette,
  pattern = { "cmdpalette" },
  callback = function()
    vim.cmd.inoreabbrev("h", "tab help")
    vim.keymap.set("i", "<Tab>", function()
      require("cmp").complete()
    end, { buffer = true })
  end,
})

vim.api.nvim_create_autocmd("BufLeave", {
  group = cmdpalette,
  pattern = "cmdpalette",
  callback = function()
    vim.cmd.iunabbrev "h"
  end,
})
