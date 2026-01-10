vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, { buffer = bufnr })

    vim.api.nvim_create_user_command("ToggleInlayHints", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
    end, { desc = "Toggle inlay hints" })

    if client and client.server_capabilities.documentHighlightProvider then
      local group = vim.api.nvim_create_augroup("LspDocumentHighlight" .. bufnr, { clear = true })

      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        group = group,
        buffer = bufnr,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd("CursorMoved", {
        group = group,
        buffer = bufnr,
        callback = vim.lsp.buf.clear_references,
      })
    end
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
