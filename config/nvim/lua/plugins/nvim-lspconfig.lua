local nvim_lsp = require "lspconfig"

require("lspconfig.ui.windows").default_options.border = "single"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "single",
})

require("utils").on_attach(function(client, buffer)
  vim.keymap.set("n", "<Leader>gD", vim.lsp.buf.declaration, { buffer = buffer })
  vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, { buffer = buffer })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buffer })
  vim.keymap.set("n", "<Leader>gi", vim.lsp.buf.implementation, { buffer = buffer })
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = buffer })
  vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, { buffer = buffer })
  vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { buffer = buffer })
  vim.keymap.set({ "n", "v" }, "<Leader>a", vim.lsp.buf.code_action, { buffer = buffer })
  vim.keymap.set("n", "<Leader>gr", vim.lsp.buf.references, { buffer = buffer })
end)

local servers = { "solargraph", "pylsp", "gdscript", "tsserver" }
local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
  }
end

nvim_lsp.rust_analyzer.setup {
  capabilities = capabilities,
}

nvim_lsp.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
        disable = { "missing-fields", "incomplete-signature-doc" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

--Enable (broadcasting) snippet capability for completion
local capabilities_2 = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers_2 = { "cssls", "jsonls" }
for _, lsp in ipairs(servers_2) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities_2,
  }
end
