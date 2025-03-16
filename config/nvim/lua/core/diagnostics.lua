local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}

require("utils").on_attach(function(client, buffer)
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = buffer,
    callback = function()
      local diagnostic_opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = true,
        prefix = " ",
        scope = "line",
        header = "",
        title = "Diagnostics",
        title_pos = "left",
      }
      vim.diagnostic.open_float(nil, diagnostic_opts)
    end,
  })
end)
