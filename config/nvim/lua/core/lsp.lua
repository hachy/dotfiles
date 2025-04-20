vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, { buffer = ev.buf })

    vim.api.nvim_create_user_command("ToggleInlayHints", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
    end, { desc = "Toggle inlay hints" })
  end,
})

vim.lsp.enable {
  "clangd",
  "cssls",
  "gdscript",
  "gopls",
  "jsonls",
  "lua_ls",
  "ruby_lsp",
  "rust_analyzer",
}
