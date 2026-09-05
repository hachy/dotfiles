vim.loader.enable()

require "core/autocmds"
require "core/mappings"
require "core/options"
require "core/lsp"
require "core/diagnostic"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local lazy_plugins = {
  {
    "hachy/eva01.vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "eva01-LCL"
    end,
    dev = true,
  },

  {
    "hachy/cmdpalette.nvim",
    config = function()
      require "plugins.cmdpalette"
    end,
    dev = true,
  },

  {
    "hachy/felir.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Felir",
    keys = { { "<Space>f", "<Plug>(felir)" } },
    opts = {},
    dev = true,
  },

  {
    "hachy/recmdwin.nvim",
    event = "CmdWinEnter",
    keys = { { "Q:", "q:" } },
    opts = {},
    dev = true,
  },

  {
    "neovim/nvim-lspconfig",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require "plugins.treesitter"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
      vim.g.no_plugin_maps = true
    end,
    config = function()
      vim.keymap.set({ "x", "o" }, "af", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "if", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ac", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ic", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
      end)
      -- You can also use captures from other query groups like `locals.scm`
      vim.keymap.set({ "x", "o" }, "as", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
      end)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
  },

  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    config = function()
      require "plugins.formatter"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    config = function()
      require "plugins.nvim-lint"
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    event = "VeryLazy",
    dependencies = { "honza/vim-snippets" },
    config = function()
      require("luasnip.loaders.from_snipmate").lazy_load()
      local ls = require "luasnip"

      vim.keymap.set({ "i" }, "<C-K>", function()
        ls.expand()
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-L>", function()
        ls.jump(1)
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-J>", function()
        ls.jump(-1)
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
    end,
  },

  {
    "hedyhli/outline.nvim",
    cmd = "Outline",
    keys = { { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle Outline" } },
    opts = {
      outline_items = {
        show_symbol_details = false,
      },
      symbols = {
        filter = { "Class", "Method", "Function" },
      },
    },
  },

  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      chunk = {
        enable = true,
        style = { { fg = "#b67e5d" } },
      },
      indent = { enable = true, chars = { "¦" } },
      blank = { enable = false },
    },
  },

  {
    "m4xshen/autoclose.nvim",
    event = "InsertEnter",
    opts = {
      keys = {
        ["`"] = { escape = false, close = true, pair = "``" },
      },
    },
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },

  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {},
  },

  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<C-p>", "<Cmd>FzfLua files<CR>", silent = true },
      { "<Space>b", "<Cmd>FzfLua buffers<CR>", silent = true },
      { "<Space>G", "<Cmd>FzfLua live_grep<CR>", silent = true },
      { "<Space>h", "<Cmd>FzfLua history<CR>", silent = true },
      { "<Space>ml", "<Cmd>FzfLua files cwd='~/Dropbox/memo'<CR>", silent = true },
    },
  },

  {
    "hachy/instarun.nvim",
    cmd = "Instarun",
    keys = {
      { "<Leader>r", "<Plug>(instarun)", desc = "Instarun" },
      { "<Leader>q", "<Cmd>bw! instarun://output<CR>", desc = "quit Instarun", silent = true },
    },
    opts = {
      defaults = {
        term_name = "instarun://output",
        cursor_jump = false,
      },
    },
    dev = true,
  },

  {
    "tpope/vim-fugitive",
    keys = {
      { "<Space>gd", "<Cmd>Gvdiffsplit<CR>" },
      { "<Space>gs", "<Cmd>Git<CR>" },
    },
    cmd = { "Gvdiffsplit", "Git" },
  },
}

local opts = {
  dev = {
    path = "~/ghq/github.com/hachy",
    patterns = { "eva01.vim", "cmdpalette.nvim", "felir.nvim", "recmdwin.nvim", "instarun.nvim" },
    fallback = false,
  },
  install = {
    colorscheme = { "eva01-LCL" },
  },
}

require("lazy").setup(lazy_plugins, opts)
