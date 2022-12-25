require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "html",
    "css",
    "lua",
    "python",
    "ruby",
    "json",
    "javascript",
    "markdown",
    "diff",
    "vim",
    "comment",
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
