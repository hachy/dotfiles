vim.loader.enable()

require "core/autocmds"
require "core/options"
require "core/mappings"
require "core/statusline"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local lazy_plugins = {
  {
    "hachy/eva01.vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "eva01-LCL"
      vim.cmd [[hi! Normal ctermbg=NONE guibg=NONE]]
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
    lazy = true,
    cmd = { "Nvf", "NvfNew" },
    config = function()
      require("nvf").setup {}
    end,
    dev = true,
  },

  {
    "hachy/recmdwin.nvim",
    lazy = true,
    event = "CmdWinEnter",
    config = function()
      require("recmdwin").setup()
    end,
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
    dependencies = {
      {
        "nvim-treesitter/playground",
        cmd = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
      },
    },
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
    lazy = true,
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
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require "plugins.indent-blankline"
    end,
  },

  {
    "m4xshen/autoclose.nvim",
    lazy = true,
    event = "InsertEnter",
    config = function()
      require("autoclose").setup {
        keys = {
          ["`"] = { escape = false, close = true, pair = "``" },
        },
      }
    end,
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {}
    end,
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function()
      require("colorizer").setup {}
    end,
  },

  {
    "junegunn/fzf",
    build = "./install --all",
    event = "VeryLazy",
    dependencies = {
      "junegunn/fzf.vim",
      "pbogut/fzf-mru.vim",
    },
    config = function()
      vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git'"
      vim.g.fzf_buffers_jump = 1
      vim.g.fzf_layout = { window = { width = 0.9, height = 0.9 } }
      vim.g.fzf_preview_window = { "down,50%", "ctrl-/" }
    end,
  },

  {
    "thinca/vim-quickrun",
    event = "VeryLazy",
    config = function()
      vim.g.quickrun_config = { _ = { ["outputter/buffer/opener"] = '%{winwidth(0) >= 100 ? "vnew" : "15new"}' } }

      local id = vim.api.nvim_create_augroup("qr_augroup", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = id,
        pattern = "quickrun",
        callback = function()
          vim.keymap.set("n", "q", "<Cmd>quit<CR>", { buffer = true, silent = true })
        end,
        desc = " Close help by pressing q.",
      })
    end,
  },

  {
    "glidenote/memolist.vim",
    lazy = true,
    cmd = { "MemoNew", "MemoList", "MemoGrep" },
    config = function()
      vim.g.memolist_fzf = 1
      vim.g.memolist_memo_date = "%Y-%m-%d"
      vim.g.memolist_memo_suffix = "markdown"
      vim.g.memolist_path = vim.env.HOME .. "/Dropbox/memo"
      vim.g.memolist_template_dir_path = "~/config/nvim/template"
    end,
  },

  {
    "tpope/vim-fugitive",
    lazy = true,
    cmd = { "Gvdiffsplit", "Git" },
  },

  {
    "RRethy/vim-illuminate",
    config = function()
      vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#434a59" })
      vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#434a59" })
      vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#434a59" })
    end,
  },
}

local opts = {
  dev = {
    path = "~/ghq/github.com/hachy",
    patterns = { "eva01.vim", "cmdpalette.nvim", "nvf.nvim", "recmdwin.nvim" },
    fallback = false,
  },
}

require("lazy").setup(lazy_plugins, opts)
