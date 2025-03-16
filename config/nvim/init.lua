vim.loader.enable()

require "core/autocmds"
require "core/diagnostics"
require "core/mappings"
require "core/options"
require "core/statusline"

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
    "hachy/nvf.nvim",
    cmd = { "Nvf", "NvfNew" },
    keys = { { "<Space>f", "<Cmd>Nvf<CR>" } },
    opts = {},
    dev = true,
  },

  {
    "hachy/recmdwin.nvim",
    event = "CmdWinEnter",
    keys = { { ";", "q:" } },
    opts = {},
    dev = true,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/neodev.nvim",
        config = function()
          require("neodev").setup {}
        end,
      },
    },
    config = function()
      require "plugins.nvim-lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "plugins.treesitter"
    end,
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
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
    },
    config = function()
      require "plugins.nvim-cmp"
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    event = "VeryLazy",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = "./my_snippets",
        override_priority = 2000,
      }
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require("lsp_signature").setup {}
      require("lsp_signature").on_attach()
    end,
  },

  {
    "hedyhli/outline.nvim",
    cmd = "Outline",
    keys = { { "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" } } },
    opts = {},
  },

  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      chunk = {
        enable = true,
        style = {
          { fg = "#b67e5d" },
        },
      },
      indent = {
        enable = true,
      },
      blank = {
        enable = true,
      },
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
    "NvChad/nvim-colorizer.lua",
    event = "VeryLazy",
    opts = {},
  },

  {
    "junegunn/fzf",
    build = "./install --all",
    lazy = false,
    dependencies = {
      "junegunn/fzf.vim",
      "pbogut/fzf-mru.vim",
    },
    keys = {
      { "<C-p>", "<Cmd>Files<CR>", silent = true },
      { "<Space>b", "<Cmd>Buffers<CR>", silent = true },
      { "<Space>G", "<Cmd>Rg<CR>", silent = true },
      { "<Space>h", "<Cmd>FZFMru<CR>", silent = true },
    },
    init = function()
      vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git'"
      vim.g.fzf_buffers_jump = 1
      vim.g.fzf_layout = { window = { width = 0.9, height = 0.9 } }
      vim.g.fzf_preview_window = { "down,50%", "ctrl-/" }
    end,
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "hachy/instarun.nvim",
    cmd = "Instarun",
    keys = {
      { "<Leader>r", "<Plug>(instarun)" },
      { "<Leader>q", "<Cmd>bw! instarun://output<CR>", silent = true },
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
    "glidenote/memolist.vim",
    cmd = { "MemoNew", "MemoList", "MemoGrep" },
    keys = {
      { "<Space>mn", "<Cmd>MemoNew<CR>" },
      { "<Space>ml", "<Cmd>MemoList<CR>" },
      { "<Space>mg", "<Cmd>MemoGrep<CR>" },
    },
    init = function()
      vim.g.memolist_fzf = 1
      vim.g.memolist_memo_date = "%Y-%m-%d"
      vim.g.memolist_memo_suffix = "markdown"
      vim.g.memolist_path = vim.env.HOME .. "/Dropbox/memo"
      vim.g.memolist_template_dir_path = "~/config/nvim/template"
    end,
  },

  {
    "tpope/vim-fugitive",
    keys = {
      { "<Space>gd", "<Cmd>Gvdiffsplit<CR>" },
      { "<Space>gs", "<Cmd>Git<CR>" },
    },
    cmd = { "Gvdiffsplit", "Git" },
  },

  {
    "RRethy/vim-illuminate",
  },
}

local opts = {
  dev = {
    path = "~/ghq/github.com/hachy",
    patterns = { "eva01.vim", "cmdpalette.nvim", "nvf.nvim", "recmdwin.nvim", "instarun.nvim" },
    fallback = false,
  },
  install = {
    colorscheme = { "eva01-LCL" },
  },
}

require("lazy").setup(lazy_plugins, opts)
