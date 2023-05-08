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

require("lazy").setup {
  {
    "hachy/eva01.vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "eva01-LCL"
      vim.cmd [[hi! Normal ctermbg=NONE guibg=NONE]]
    end,
  },

  {
    "hachy/cmdpalette.nvim",
    config = function()
      require "plugins.cmdpalette"
    end,
  },

  {
    "hachy/nvf.nvim",
    config = function()
      require("nvf").setup {}
    end,
  },

  {
    "hachy/recmdwin.nvim",
    config = function()
      require("recmdwin").setup()
    end,
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
      "notomo/cmp-neosnippet",
    },
    config = function()
      require "plugins.nvim-cmp"
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup {}
      require("lsp_signature").on_attach()
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "plugins.indent-blankline"
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  },

  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup {}
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
    config = function()
      require("Comment").setup {}
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup {}
    end,
  },

  {
    "junegunn/fzf",
    build = "./install --all",
    dependencies = {
      "junegunn/fzf.vim",
      "pbogut/fzf-mru.vim",
    },
    laze = false,
    config = function()
      vim.cmd [[
        let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git'"
        let g:fzf_buffers_jump = 1
        let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
        let g:fzf_preview_window = ['down,50%', 'ctrl-/']
        ]]
    end,
  },

  {
    "Shougo/neosnippet.vim",
    event = "InsertEnter",
    dependencies = {
      "Shougo/neosnippet-snippets",
    },
    config = function()
      vim.cmd [[
        let g:neosnippet#snippets_directory = $HOME.'/dotfiles/config/nvim/snippets'
        let g:neosnippet#disable_runtime_snippets = {
        \   'c' : 1
        \ }
        ]]
    end,
  },

  {
    "thinca/vim-quickrun",
    config = function()
      vim.cmd [[
        let g:quickrun_config = {}
        let g:quickrun_config._ = {}
        let g:quickrun_config._['outputter/buffer/opener'] ='%{winwidth(0) >= 100 ? "vnew" : "15new"}'
        let g:quickrun_config.ruby = {'command' : 'ruby'}
        let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'exec': 'bundle exec %c %o', 'cmdopt': '-f d --color'}
        let g:quickrun_config.cpp = { 'cmdopt': '-std=c++11' }
        let g:quickrun_config.rust = {'exec' : 'cargo run'}
        ]]

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
    config = function()
      vim.cmd [[
        let g:memolist_fzf = 1
        let g:memolist_memo_date = '%Y-%m-%d'
        let g:memolist_memo_suffix = 'markdown'
        let g:memolist_path = $HOME.'/Dropbox/memo'
        let g:memolist_template_dir_path = '~/config/nvim/template'
        ]]
    end,
  },

  {
    "tpope/vim-fugitive",
  },
}
