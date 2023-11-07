vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- speed up lua plugins
    -- it is recommended to put impatient.nvim before any other plugins
    use { "lewis6991/impatient.nvim", config = [[require('impatient')]] }

    use { "wbthomason/packer.nvim", opt = true }

    use { "onsails/lspkind-nvim", event = "VimEnter" }
    -- auto-completion engine
    use { "hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require('config.nvim-cmp')]] }

    -- Snippet engine and snippet template
    use { "SirVer/ultisnips", event = "InsertEnter" }
    use { "honza/vim-snippets", after = "ultisnips" }

    -- nvim-cmp completion sources
    use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
    use { "hrsh7th/cmp-path", after = "nvim-cmp" }
    use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
    use { "hrsh7th/cmp-omni", after = "nvim-cmp" }
    use { "quangnguyen30192/cmp-nvim-ultisnips", after = { "nvim-cmp", "ultisnips" } }

    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    -- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
    use { "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require('config.lsp')]] }

    -- use { "neoclide/coc.nvim", branch = 'release'}

    use {
      "nvim-treesitter/nvim-treesitter",
      event = "BufEnter",
      run = ":TSUpdate",
      config = [[require('config.treesitter')]],
    }

    -- Python indent (follows the PEP8 style)
    -- use { "Vimjas/vim-python-pep8-indent", ft = { "python" } }

    -- Python-related text object
    -- use { "jeetsukumaran/vim-pythonsense", ft = { "python" } }

    -- swap delimited items
    use { "machakann/vim-swap", event = "VimEnter" }

    -- Super fast buffer jump
    use {
      "phaazon/hop.nvim",
      event = "VimEnter",
      config = function()
        vim.defer_fn(function()
          require("config.nvim_hop")
        end, 2000)
      end,
    }

    -- Show match number and index for searching
    use {
      "kevinhwang91/nvim-hlslens",
      branch = "main",
      keys = { { "n", "*" }, { "n", "#" }, { "n", "n" }, { "n", "N" } },
      config = [[require('config.hlslens')]],
    }

    -- Stay after pressing * and search selected text
    -- use { "haya14busa/vim-asterisk", event = "VimEnter" }

    -- File search, tag search and more
    if vim.g.is_win then
      use { "Yggdroot/LeaderF", cmd = "Leaderf" }
    else
      use { "Yggdroot/LeaderF", cmd = "Leaderf", run = ":LeaderfInstallCExtension" }
    end

    -- Fuzzy finder
    use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      requires = { { "nvim-lua/plenary.nvim" } },
    }

    -- search emoji and other symbols
    use { "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" }

    -- A list of colorscheme plugin you may want to try. Find what suits you.
    --use { "lifepillar/vim-gruvbox8", opt = true }
    --use { "navarasu/onedark.nvim", opt = true }
    --use { "sainnhe/edge", opt = true }
    --use { "sainnhe/sonokai", opt = true }
    --use { "sainnhe/gruvbox-material", opt = true }
    --use { "shaunsingh/nord.nvim", opt = true }
    --use { "NTBBloodbath/doom-one.nvim", opt = true }
    --use { "sainnhe/everforest", opt = true }
    --use { "EdenEast/nightfox.nvim", opt = true }
    --use { "rebelot/kanagawa.nvim", opt = true }
    --use { "catppuccin/nvim", as = "catppuccin", opt = true }
    --use({'glepnir/zephyr-nvim', opt = true})

    use {
      'navarasu/onedark.nvim',
      config = function()
        require('onedark').load()
	vim.opt.background = 'dark'
      end
    }

    use {
      "sonph/onehalf",
      rtp = 'vim/',
      config = function()
        --vim.opt.background = 'light'
        --vim.cmd.colorscheme('onehalflight')
        vim.opt.background = 'dark'
        vim.cmd.colorscheme('onehalfdark')
      end,
      }

    --use 'kvrohit/rasmus.nvim'

    -- color switcher
    -- use 'xolox/vim-misc'
    -- use 'xolox/vim-colorscheme-switcher'


    use { "kyazdani42/nvim-web-devicons" }

    use {
      "nvim-lualine/lualine.nvim",
      event = "VimEnter",
      cond = firenvim_not_active,
      config = [[require('config.statusline')]],
    }

    use { "akinsho/bufferline.nvim", event = "VimEnter",
      cond = firenvim_not_active,
      config = [[require('config.bufferline')]] }

    -- fancy start screen
    -- use { "glepnir/dashboard-nvim", event = "VimEnter",
    --  cond = firenvim_not_active,
    --  config = [[require('config.dashboard-nvim')]]
    -- }

    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "VimEnter",
      config = [[require('config.indent-blankline')]],
    }

    -- Highlight URLs inside vim
    -- use { "itchyny/vim-highlighturl", event = "VimEnter" }

    -- notification plugin
    use {
      "rcarriga/nvim-notify",
      event = "BufEnter",
      config = function()
        vim.defer_fn(function()
          require("config.nvim-notify")
        end, 2000)
      end,
    }

    -- open URL in browser
    use { "tyru/open-browser.vim", event = "VimEnter" }

    -- Automatic insertion and deletion of a pair of characters
    use { "Raimondi/delimitMate", event = "InsertEnter" }

    -- Comment plugin
    use {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }

    use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup({
	    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
	  })
      end
    }

    -- Multiple cursor plugin like Sublime Text?
    -- use 'mg979/vim-visual-multi'

    -- Autosave files on certain events
    --use({
    --  "Pocco81/auto-save.nvim",
    --  config = function()
    --  require("auto-save").setup {
    --    enabled = true,
    --    trigger_events = {"FocusLost"}
    --  }
    --  end,
    --})

    -- Show undo history visually
    use { "simnalamburt/vim-mundo", cmd = { "MundoToggle", "MundoShow" } }

    -- Manage your yank history
    if vim.g.is_win or vim.g.is_mac then
      use { "svermeulen/vim-yoink", event = "VimEnter" }
    end

    -- Handy unix command inside Vim (Rename, Move etc.)
    use { "tpope/vim-eunuch", cmd = { "Rename", "Delete" } }

    use { "tpope/vim-unimpaired" }
    use { "tpope/vim-endwise" }
    use { "tpope/vim-rails" }

    -- Repeat vim motions
    use { "tpope/vim-repeat", event = "VimEnter" }

    use { "nvim-zh/better-escape.vim", event = { "InsertEnter" } }

    use { "lyokha/vim-xkbswitch", event = { "InsertEnter" } }
    -- if vim.g.is_mac then
    --  use { "lyokha/vim-xkbswitch", event = { "InsertEnter" } }
    -- elseif vim.g.is_win then
    --  use { "Neur1n/neuims", event = { "InsertEnter" } }
    -- end

    -- Auto format tools
    use { "sbdchd/neoformat", cmd = { "Neoformat" } }

    -- Git command inside vim
    -- use { "tpope/vim-fugitive", event = "User InGitRepo", config = [[require('config.fugitive')]] }
    use { "tpope/vim-fugitive", config = [[require('config.fugitive')]] }

    -- Better git log display
    use { "rbong/vim-flog", requires = "tpope/vim-fugitive", cmd = { "Flog" } }

    use { "christoomey/vim-conflicted", requires = "tpope/vim-fugitive", cmd = { "Conflicted" } }

    use {
      "ruifm/gitlinker.nvim",
      requires = "nvim-lua/plenary.nvim",
      event = "User InGitRepo",
      config = [[require('config.git-linker')]],
    }

    -- Show git change (change, delete, add) signs in vim sign column
    -- use { "lewis6991/gitsigns.nvim", config = [[require('config.gitsigns')]] }

    -- Better git commit experience
    use { "rhysd/committia.vim", opt = true, setup = [[vim.cmd('packadd committia.vim')]] }

    -- Better quickfix window
    use { "kevinhwang91/nvim-bqf", ft = "qf", config = [[require('config.bqf')]] }

    -- Another markdown plugin
    use { "preservim/vim-markdown", ft = { "markdown" } }

    -- Faster footnote generation
    use { "vim-pandoc/vim-markdownfootnotes", ft = { "markdown" } }

    -- Vim tabular plugin for manipulate tabular, required by markdown plugins
    use { "godlygeek/tabular", cmd = { "Tabularize" } }

    -- :UnicodeName :UnicodeSearch :UnicodeTable
    use { "chrisbra/unicode.vim", event = "VimEnter" }

    -- Additional powerful text object for vim, this plugin should be studied
    -- carefully to use its full power
    -- use { "wellle/targets.vim", event = "VimEnter" }

    -- Plugin to manipulate character pairs quickly
    use { "machakann/vim-sandwich", event = "VimEnter" }

    -- Add indent object for vim (useful for languages like Python)
    use { "michaeljsmith/vim-indent-object", event = "VimEnter" }

    -- .tmux.conf syntax highlighting and setting check
    use { "tmux-plugins/vim-tmux", ft = { "tmux" } }

    -- Modern matchit implementation
    use { "andymass/vim-matchup", event = "VimEnter" }

    -- Smoothie motions
    -- use {
    --  "karb94/neoscroll.nvim",
    --  event = "VimEnter",
    --  config = function()
    --    vim.defer_fn(function()
    --      require("config.neoscroll")
    --    end, 2000)
    --  end,
    -- }

    -- use { "tpope/vim-scriptease", cmd = { "Scriptnames", "Message", "Verbose" } }

    -- Asynchronous command execution
    use { "skywind3000/asyncrun.vim", opt = true, cmd = { "AsyncRun" } }

    use { "cespare/vim-toml", ft = { "toml" }, branch = "main" }

    -- A Vim / Neovim plugin to copy text to the system clipboard from anywhere using the ANSI OSC52 sequence.
    -- use { "ojroques/vim-oscyank", cmd = { "OSCYank", "OSCYankReg" } }

    -- The missing auto-completion for cmdline!
    use { "gelguy/wilder.nvim", opt = true, setup = [[vim.cmd('packadd wilder.nvim')]] }

    -- showing keybindings
    -- use {
    --  "folke/which-key.nvim",
    --  event = "VimEnter",
    --  config = function()
    --    vim.defer_fn(function()
    --      require("config.which-key")
    --    end, 2000)
    --  end,
    -- }

    -- show and trim trailing whitespaces
    use { "jdhao/whitespace.nvim", event = "VimEnter" }

    -- file explorer
    use {
      "kyazdani42/nvim-tree.lua",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = [[require('config.nvim-tree')]],
    }

    use { "ii14/emmylua-nvim", ft = "lua" }

    -- use { "j-hui/fidget.nvim", after = "nvim-lspconfig", config = [[require('config.fidget-nvim')]] }

    use { "mileszs/ack.vim" }

    use { "fatih/vim-go" }

    use { "gpanders/editorconfig.nvim" }

    use { "tomarrell/vim-npr"}


    -- broken TODO enable later
    -- use {
	    -- "chrisgrieser/nvim-early-retirement",
	    -- config = function () require("early-retirement").setup() end,
    -- }

    use { "codelitt/vim-qtpl" }
end)
