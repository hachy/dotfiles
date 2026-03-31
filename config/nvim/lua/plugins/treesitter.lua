require("nvim-treesitter").install {
  "comment",
  "css",
  "diff",
  "gdscript",
  "html",
  "javascript",
  "json",
  "latex",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "ruby",
  "rust",
  "vim",
}

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(args.match)
    if not lang then
      return
    end
    local parser = vim.treesitter.get_parser(args.buf, lang)
    if not parser then
      return
    end
    vim.treesitter.start()
  end,
})
