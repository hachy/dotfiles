require("conform").setup {
  formatters_by_ft = {
    cpp = { "clang-format" },
    css = { "biome" },
    gdscript = { "gdformat" },
    go = { "gofmt" },
    javascript = { "biome" },
    json = { "biome" },
    lua = { "stylua" },
    python = { "ruff_format" },
    ruby = { "rubyfmt" },
    rust = { "rustfmt" },
    typescript = { "biome", lsp_format = "fallback" },
  },
  format_on_save = {
    lsp_format = "never",
  },
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf }
  end,
})
