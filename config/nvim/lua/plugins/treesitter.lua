require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "comment",
    "css",
    "diff",
    "html",
    "javascript",
    "json",
    "latex",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "ruby",
    "vim",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "vim" },
    -- additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = { "python" },
  },
}
