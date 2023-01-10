local cmp = require "cmp"

cmp.setup {
  snippet = {
    expand = function(_) end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = false },
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = cmp.config.sources {
    { name = "nvim_lsp" },
    { name = "neosnippet" },
    { name = "buffer" },
    { name = "path" },
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        neosnippet = "[Snip]",
      })[entry.source.name]
      return vim_item
    end,
  },
}

cmp.setup.filetype("cmdpalette", {
  completion = {
    autocomplete = false,
  },
  sources = {
    { name = "cmdline" },
    { name = "path" },
  },
})
