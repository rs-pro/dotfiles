return {
  -- speed up lua plugins
  { "lewis6991/impatient.nvim", lazy = false, config = function() require('impatient') end },

  -- LSP and completion
  { "onsails/lspkind-nvim", event = "VeryLazy" },
  
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-omni",
    },
    event = "InsertEnter",
    config = function() require('config.nvim-cmp') end,
  },


  -- Mason
  { "williamboman/mason.nvim", lazy = false },
  { "williamboman/mason-lspconfig.nvim", lazy = false },
  
  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    event = { "BufReadPre", "BufNewFile" },
    config = function() require('config.lsp') end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function() require('config.treesitter') end,
  },

  -- Utilities
  { "machakann/vim-swap", event = "VeryLazy" },
  
  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
    config = function()
      vim.defer_fn(function()
        require("config.nvim_hop")
      end, 2000)
    end,
  },

  {
    "kevinhwang91/nvim-hlslens",
    branch = "main",
    keys = {
      { "*", mode = "n" },
      { "#", mode = "n" },
      { "n", mode = "n" },
      { "N", mode = "n" },
    },
    config = function() require('config.hlslens') end,
  },

  -- File search
  {
    "Yggdroot/LeaderF",
    lazy = false,
    build = function()
      if not vim.g.is_win then
        vim.cmd(":LeaderfInstallCExtension")
      end
    end,
    config = function()
      -- Force load LeaderF commands
      vim.cmd("runtime! plugin/leaderf.vim")
      -- Configure arrow keys for navigation instead of history
      vim.g.Lf_CommandMap = {
        ['<Up>'] = '<C-k>',
        ['<Down>'] = '<C-j>',
      }
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-symbols.nvim",
    },
  },

  -- Colorschemes
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('onedark').load()
      vim.opt.background = 'dark'
    end,
  },

  {
    "sonph/onehalf",
    lazy = false,
    priority = 999,
    config = function()
      vim.opt.rtp:append(vim.fn.stdpath("data") .. "/lazy/onehalf/vim")
      vim.opt.background = 'dark'
      vim.cmd.colorscheme('onehalfdark')
    end,
  },

  -- UI
  { "nvim-tree/nvim-web-devicons", opts = {} },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    cond = function() return vim.g.started_by_firenvim == nil end,
    config = function() require('config.statusline') end,
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    cond = function() return vim.g.started_by_firenvim == nil end,
    config = function() require('config.bufferline') end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = function() require('config.indent-blankline') end,
  },

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      vim.defer_fn(function()
        require("config.nvim-notify")
      end, 2000)
    end,
  },

  -- Editor enhancements
  { "tyru/open-browser.vim", lazy = false },
  { "Raimondi/delimitMate", event = "InsertEnter" },
  
  -- Comments
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = false },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end,
  },

  -- Auto save
  {
    "Pocco81/auto-save.nvim",
    event = "VeryLazy",
    config = function()
      require("auto-save").setup({
        enabled = true,
        trigger_events = {"FocusLost"}
      })
    end,
  },

  -- Undo tree
  { "simnalamburt/vim-mundo", cmd = { "MundoToggle", "MundoShow" } },

  -- Yank management
  {
    "svermeulen/vim-yoink",
    event = "VeryLazy",
    cond = function() return vim.g.is_win or vim.g.is_mac end,
  },

  -- Unix commands
  { "tpope/vim-eunuch", cmd = { "Rename", "Delete" } },

  -- Tpope essentials
  { "tpope/vim-unimpaired", lazy = false },
  { "tpope/vim-endwise", lazy = false },
  { "tpope/vim-rails", lazy = false },
  { "tpope/vim-repeat", lazy = false },

  -- Better escape
  { "nvim-zh/better-escape.vim", lazy = false },
  { "lyokha/vim-xkbswitch", lazy = false },

  -- Formatting
  { "sbdchd/neoformat", cmd = "Neoformat" },

  -- Git
  {
    "tpope/vim-fugitive",
    lazy = false,
    config = function() require('config.fugitive') end,
  },

  {
    "rbong/vim-flog",
    dependencies = { "tpope/vim-fugitive" },
    cmd = "Flog",
  },

  {
    "christoomey/vim-conflicted",
    dependencies = { "tpope/vim-fugitive" },
    cmd = "Conflicted",
  },

  {
    "ruifm/gitlinker.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function() 
      require('gitlinker').setup()
    end,
  },

  { "rhysd/committia.vim", ft = "gitcommit" },

  -- Better quickfix
  { "kevinhwang91/nvim-bqf", ft = "qf", config = function() require('config.bqf') end },

  -- Markdown
  { "preservim/vim-markdown", ft = "markdown" },
  { "vim-pandoc/vim-markdownfootnotes", ft = "markdown" },
  { "godlygeek/tabular", cmd = "Tabularize" },

  -- Unicode
  { "chrisbra/unicode.vim", lazy = false },

  -- Text objects
  { "machakann/vim-sandwich", lazy = false },

  -- Language support
  { "maxmellon/vim-jsx-pretty", lazy = false },
  { "tmux-plugins/vim-tmux", lazy = false },
  { "cespare/vim-toml", branch = "main", lazy = false },
  { "ii14/emmylua-nvim", lazy = false },
  { "fatih/vim-go", lazy = false },
  { "codelitt/vim-qtpl", lazy = false },

  -- Matchup
  { "andymass/vim-matchup", lazy = false },

  -- Async
  { "skywind3000/asyncrun.vim", cmd = "AsyncRun" },

  -- Wilder
  {
    "gelguy/wilder.nvim",
    event = "CmdlineEnter",
    config = function()
      -- Wilder configuration can be added here
    end,
  },

  -- Whitespace
  { "jdhao/whitespace.nvim", lazy = false },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function() require('config.nvim-tree') end,
  },

  -- Other plugins
  {
    "glebtv/ack.vim",
    opts = { debug = true }
  },
  { "gpanders/editorconfig.nvim", lazy = false },
  { "tomarrell/vim-npr", lazy = false },
  {
    'doums/rg.nvim',
    lazy = false,
    config = function()
      require('rg').setup()
    end,
  }
}
