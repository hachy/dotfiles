local util = require "formatter.util"

require("formatter").setup {
  logging = false,
  filetype = {
    ruby = {
      require("formatter.filetypes.ruby").rubocop,
    },
    gdscript = {
      function()
        return {
          exe = "gdformat",
          stdin = false,
        }
      end,
    },
    python = {
      require("formatter.filetypes.python").black,
    },
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    html = {
      require("formatter.filetypes.html").prettier,
    },
    cpp = {
      require("formatter.filetypes.cpp").clangformat,
    },
    css = {
      function()
        return {
          exe = "stylelint",
          args = {
            "--fix",
            "--stdin",
            "--stdin-filename",
            util.escape_path(util.get_current_buffer_file_path()),
          },
          stdin = true,
          try_node_modules = true,
        }
      end,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },
    rust = {
      require("formatter.filetypes.rust").rustfmt,
    },
    toml = {
      require("formatter.filetypes.toml").taplo,
    },
    go = {
      require("formatter.filetypes.go").gofmt,
    },
    json = {
      require("formatter.filetypes.json").prettier,
    },
    yaml = {
      require("formatter.filetypes.yaml").prettier,
    },
    yml = {
      require("formatter.filetypes.yaml").prettier,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
}

local format_auto_group = vim.api.nvim_create_augroup("FormatAutogroup", {})
vim.api.nvim_create_autocmd("BufWritePost", {
  command = "FormatWrite",
  group = format_auto_group,
  pattern = "*",
})
