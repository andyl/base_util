-- packer_list - define list of Packer Plugins

PackerOk, Packer = pcall(require, "packer")
if not PackerOk then return end

return Packer.startup(function(use)
  -- NEOVIM BASICS
  use 'wbthomason/packer.nvim'                 -- let Packer manage itself
  use 'nvim-lua/popup.nvim'                    -- the vim Popup API
  use 'nvim-lua/plenary.nvim'                  -- common lua functions
  -- NVIM-TREE
  use 'kyazdani42/nvim-web-devicons'           -- webfonts
  use 'kyazdani42/nvim-tree.lua'               -- nvimtree file explorer
  -- WHICH-KEY
  use 'folke/which-key.nvim'                   -- key mapper and displayer
  -- TREESITTER
  use 'nvim-treesitter/nvim-treesitter'        -- syntax highlighter
  use 'nvim-treesitter/playground'             -- display treesitter AST
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- LSP
  use 'williamboman/mason.nvim'                -- package installer
  use 'williamboman/mason-lspconfig.nvim'      -- language-server installer
  use 'neovim/nvim-lspconfig'                  -- enable LSP servers and set properties
  use 'jose-elias-alvarez/null-ls.nvim'        -- for formatters and linters
  -- DAP
  use 'mfussenegger/nvim-dap'                  -- debug adapter protocol
  -- NEOVIM/TERMINAL
  use 'benmills/vimux'                         -- tmux integration
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()              -- terminal management
  end}
  -- TELESCOPE
  use 'nvim-telescope/telescope.nvim'          -- fuzzy finder
  -- SNIPPETS
  use 'L3MON4D3/LuaSnip'                       -- snippet engine
  -- CMP/COMPLETION
  use 'hrsh7th/nvim-cmp'                       -- the completion plugin
  use 'hrsh7th/cmp-buffer'                     -- buffer completions
  use 'hrsh7th/cmp-path'                       -- path completions
  use 'hrsh7th/cmp-cmdline'                    -- cmdline completions
  use 'saadparwaiz1/cmp_luasnip'               -- snippet completions
  use 'hrsh7th/cmp-nvim-lsp'                   -- lsp integration
  -- GIT
  use 'lewis6991/gitsigns.nvim'                -- git integration
  -- STATUS LINES
  use 'nvim-lualine/lualine.nvim'              -- status line
  use 'crispgm/nvim-tabline'                   -- tab line
  -- UTILITY
  use 'andyl/nvls'                             -- test plugin
  use 'andyl/rfx.nvim'                         -- test plugin
  use 'andyl/al-gtd'                           -- GTD
  -- EDITING UTILS
  use 'dhruvasagar/vim-table-mode'             -- vim table mode
  use 'junegunn/vim-easy-align'                -- column alignment
  -- SEARCH AND NAV
  use 'mileszs/ack.vim'                        -- ACK file search
  use 'tpope/vim-projectionist'                -- alternate file nav
  use 'andyl/fuzzy-projectionist.vim'          -- fzf meets projectionist (eg :Fmodel)
  -- TEXT MANIPULATION
  use 'kana/vim-textobj-user'                  -- customizable text objects
  use 'mattn/vim-textobj-url'                  -- au/iu
  use 'tpope/vim-surround'                     -- edit containing objects
  use 'tpope/vim-repeat'                       -- repeat support for plugins
  -- LANG JSON
  use 'tpope/vim-jdaddy'                       -- JSON text objects & formatting
  -- LANG ELIXIR
  use 'mhinz/vim-mix-format'                   -- wrapper to run mix format
  use 'powerman/vim-plugin-AnsiEsc'            -- docco with ANSI colors
  use 'elixir-editors/vim-elixir'              -- filetype detection
  use 'andyl/vim-projectionist-elixir'         -- elixir file navigation
  use 'andyl/vim-textobj-elixir'               -- elixir text objects
  -- COLORSCHEMES
  use 'junegunn/seoul256.vim'                  -- seoul256
  use 'NLKNguyen/papercolor-theme'             -- PaperColor
  use 'noahfrederick/vim-hemisu'               -- hemisu
  use 'sjl/badwolf'                            -- badwolf
  use 'tomasr/molokai'                         -- molokai
  use 'morhetz/gruvbox'                        -- gruvbox
  -- MARKDOWN
  use(
    {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
      ft = { "markdown" },
    }
  )
  -- LAYOUTS
  use 'andyl/zoomwintab.vim'                   -- pane zooming
  -- MISC
  use 'chrisbra/unicode.vim'                   -- :SearchUni check|C-v u2705|✅
  use 'moll/vim-bbye'                          -- delete buffer w/o closing win
  use 'lewis6991/impatient.nvim'               -- fast startup
  use 'antoinemadec/FixCursorHold.nvim'        -- needed to fix lsp doc highlight
  use 'kshenoy/vim-signature'                  -- show marks in gutter
  use 'terryma/vim-multiple-cursors'           -- multiple cursors
  -- NEOVIM LUA DEVELOPMENT
  use 'rafcamlet/nvim-luapad'                  -- neovim lua repl
  use 'folke/neodev.nvim'                      -- lsp autocompletion for nvim lua API
  -- GIST
  use 'rudylee/nvim-gist'                      -- post github gists
  -- use 'mattn/gist-vim'                         -- post github gists
  -- use 'mattn/webapi-vim'                       -- required by gist-vim
  -- NEORG - https://github.com/nvim-neorg/neorg
  use {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {}
        }
      }
    end,
    requires = "nvim-lua/plenary.nvim"
  }
  -- COMMENTS, AUTOPAIRS, LISTS
  use 'windwp/nvim-autopairs'                  -- integrates with cmp and treesitter
  use 'terrortylor/nvim-comment'               -- commenting tool
  use 'gaoDean/autolist.nvim'                  -- list generator
  -- CHATGPT
  use 'MunifTanjim/nui.nvim'                   -- UI library
  use({
    'jackMort/ChatGPT.nvim',
    config = function()
      require("chatgpt").setup({
      })
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })

end)

