-- packer_list - define list of Lazy Plugins

LazyOk, Lazy = pcall(require, "lazy")
if not LazyOk then return end

return Lazy.setup({
  -- NEOVIM BASICS
  'wbthomason/packer.nvim',                -- let Lazy manage itself
  'nvim-lua/popup.nvim',                   -- the vim Popup API
  'nvim-lua/plenary.nvim',                 -- common lua functions
  -- NVIM-TREE
  'kyazdani42/nvim-web-devicons',          -- webfonts
  'kyazdani42/nvim-tree.lua',              -- nvimtree file explorer
  -- WHICH-KEY
  'folke/which-key.nvim',                  -- key mapper and displayer
  -- TREESITTER
  'nvim-treesitter/nvim-treesitter',       -- syntax highlighter
  'nvim-treesitter/playground',            -- display treesitter AST
  'JoosepAlviste/nvim-ts-context-commentstring',
  'nvim-treesitter/nvim-treesitter-textobjects',
  -- LSP
  'williamboman/mason.nvim',               -- package installer
  'williamboman/mason-lspconfig.nvim',     -- language-server installer
  'neovim/nvim-lspconfig',                 -- enable LSP servers and set properties
  'jose-elias-alvarez/null-ls.nvim',       -- for formatters and linters
  -- DAP
  'mfussenegger/nvim-dap',                 -- debug adapter protocol
  -- NEOVIM/TERMINAL
  'benmills/vimux',                        -- tmux integration
  -- {"akinsho/toggleterm.nvim", tag = '*', config = function()
  --   require("toggleterm").setup()              -- terminal management
  -- end},
  -- TELESCOPE
  'nvim-telescope/telescope.nvim',         -- fuzzy finder
  -- SNIPPETS
  'L3MON4D3/LuaSnip',                      -- snippet engine
  -- CMP/COMPLETION
  'hrsh7th/nvim-cmp',                      -- the completion plugin
  'hrsh7th/cmp-buffer',                    -- buffer completions
  'hrsh7th/cmp-path',                      -- path completions
  'hrsh7th/cmp-cmdline',                   -- cmdline completions
  'saadparwaiz1/cmp_luasnip',              -- snippet completions
  'hrsh7th/cmp-nvim-lsp',                  -- lsp integration
  -- GIT
  'lewis6991/gitsigns.nvim',               -- git integration
  -- STATUS LINES
  'nvim-lualine/lualine.nvim',             -- status line
  'crispgm/nvim-tabline',                  -- tab line
  -- UTILITY
  'andyl/nvls',                            -- test plugin
  'andyl/rfx.nvim',                        -- test plugin
  'tpope/vim-speeddating',                 -- increment/decrement dates (C-a/C-x)
  'andyl/al-gtd',                          -- GTD
  -- EDITING UTILS
  'dhruvasagar/vim-table-mode',            -- vim table mode
  'junegunn/vim-easy-align',               -- column alignment
  -- SEARCH AND NAV
  'mileszs/ack.vim',                       -- ACK file search
  'tpope/vim-projectionist',               -- alternate file nav
  'andyl/fuzzy-projectionist.vim',         -- fzf meets projectionist (eg :Fmodel)
  -- TEXT MANIPULATION
  'kana/vim-textobj-user',                 -- customizable text objects
  'mattn/vim-textobj-url',                 -- au/iu
  'tpope/vim-surround',                    -- edit containing objects
  'tpope/vim-repeat',                      -- repeat support for plugins
  -- LANG JSON
  'tpope/vim-jdaddy',                      -- JSON text objects & formatting
  -- LANG ELIXIR
  'mhinz/vim-mix-format',                  -- wrapper to run mix format
  'powerman/vim-plugin-AnsiEsc',           -- docco with ANSI colors
  'elixir-editors/vim-elixir',             -- filetype detection
  'andyl/vim-projectionist-elixir',        -- elixir file navigation
  'andyl/vim-textobj-elixir',              -- elixir text objects
  -- COLORSCHEMES
  'junegunn/seoul256.vim',                 -- seoul256
  'NLKNguyen/papercolor-theme',            -- PaperColor
  'noahfrederick/vim-hemisu',              -- hemisu
  'sjl/badwolf',                           -- badwolf
  'tomasr/molokai',                        -- molokai
  'morhetz/gruvbox',                       -- gruvbox
  -- MARKDOWN
  'tpope/vim-markdown',                    -- syntax highlighting and folding
  -- use(
  --   {
  --     "iamcco/markdown-preview.nvim",
  --     run = "cd app && npm install",
  --     setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
  --     ft = { "markdown" },
  --   }
  -- )
  -- LAYOUTS
  'andyl/zoomwintab.vim',                  -- pane zooming
  -- MISC
  'chrisbra/unicode.vim',                  -- :SearchUni check|C-v u2705|✅
  'moll/vim-bbye',                         -- delete buffer w/o closing win
  'lewis6991/impatient.nvim',              -- fast startup
  'antoinemadec/FixCursorHold.nvim',       -- needed to fix lsp doc highlight
  'kshenoy/vim-signature',                 -- show marks in gutter
  'terryma/vim-multiple-cursors',          -- multiple cursors
  -- NEOVIM LUA DEVELOPMENT
  'rafcamlet/nvim-luapad',                 -- neovim lua repl
  'folke/neodev.nvim',                     -- lsp autocompletion for nvim lua API
  -- GIST
  'rudylee/nvim-gist',                     -- post github gists
  -- NEORG - https://github.com/nvim-neorg/neorg
  -- {
  --   "nvim-neorg/neorg",
  --   run = ":Neorg sync-parsers",
  --   config = function()
  --     require('neorg').setup {
  --       load = {
  --         ["core.defaults"] = {}
  --       }
  --     }
  --   end,
  --   requires = "nvim-lua/plenary.nvim"
  -- }
  -- OBSIDIAN - https://obsidian.md
  'epwalsh/obsidian.nvim',
  -- COMMENTS, AUTOPAIRS, LISTS
  'windwp/nvim-autopairs',                 -- integrates with cmp and treesitter
  'terrortylor/nvim-comment',              -- commenting tool
  'dkarter/bullets.vim',                   -- numbered lists
  -- 'gaoDean/autolist.nvim'                  -- list generator
  -- CHATGPT
  -- 'MunifTanjim/nui.nvim',                  -- UI library
  -- use({
  --   'jackMort/ChatGPT.nvim',
  --   config = function()
  --     require("chatgpt").setup({
  --     })
  --   end,
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   }
  -- })

})

