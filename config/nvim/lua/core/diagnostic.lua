vim.diagnostic.config {
  virtual_text = {
    current_line = true,
  },
}

vim.keymap.set("n", "<leader>d", function()
  vim.diagnostic.open_float { source = "if_many" }
end, { desc = "Show diagnostics under the cursor" })
