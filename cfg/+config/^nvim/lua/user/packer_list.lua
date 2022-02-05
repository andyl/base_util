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
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  -- LSP
  use 'neovim/nvim-lspconfig'                  -- enable LSP
  use 'williamboman/nvim-lsp-installer'        -- simple language server installer
  use 'tamago324/nlsp-settings.nvim'           -- language server settings in JSON
  use 'jose-elias-alvarez/null-ls.nvim'        -- for formatters and linters
  -- COMMENTS AND AUTOPAIRS
  use 'windwp/nvim-autopairs'                  -- integrates with cmp and treesitter
  use 'terrortylor/nvim-comment'               -- commenting tool
  -- NEOVIM/TERMINAL
  use 'benmills/vimux'                         -- tmux integration
  use 'akinsho/toggleterm.nvim'                -- terminal management
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
  use 'andyl/al-worklog'                       -- worklog
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
  -- FILE FORMATS
  use 'jtratner/vim-flavored-markdown'         -- markdown files
  -- LAYOUTS
  use 'andyl/zoomwintab.vim'                   -- pane zooming
  -- MISC
  use 'chrisbra/unicode.vim'                   -- :SearchUni check|C-v u2705|✅
  use 'moll/vim-bbye'                          -- delete buffer w/o closing win
  use 'lewis6991/impatient.nvim'               -- fast startup
  use 'antoinemadec/FixCursorHold.nvim'        -- needed to fix lsp doc highlight
  use 'kshenoy/vim-signature'                  -- show marks in gutter
  use 'rafcamlet/nvim-luapad'                  -- neovim lua repl
  use 'terryma/vim-multiple-cursors'           -- multiple cursors
  -- LANG RUBY
  -- Plug 'vim-ruby/vim-ruby'                  -- syntax highlighting
  -- Plug 'andyl/vim-projectionist-ruby'       -- ruby file navigation
  -- Plug 'nelstrom/vim-textobj-rubyblock'     -- ruby text objects
  -- Plug 'bronson/vim-ruby-block-conv'        -- toggle {} to begin/end
  -- Plug 'andyl/vim-snipmate-ruby'            -- snippets for ruby
  -- CODING UTILITIES
  -- Plug 'milkypostman/vim-togglelist'        -- toggle quicklist and location list
  -- Plug 'tpope/vim-unimpaired'               -- jump leading/trailing paren
  -- Plug 'tmhedberg/matchit'                  -- % matching
  -- Plug 'vim-scripts/SyntaxRange'            -- vimdeck syntax highlighting
  -- Plug 'liuchengxu/vim-which-key'           -- shows key mappings
  -- Plug 'janko/vim-test'                     -- test runner
  -- MISC
  -- Plug 'tpope/vim-fugitive'                 -- git integration
  -- Plug 'vim-scripts/bats.vim'               -- bats editing
  -- Plug 'gillyb/stable-windows'              -- no window scroll on split
  -- Plug 'mattn/gist-vim'                     -- post github gists
  -- Plug 'mattn/webapi-vim'                   -- required by gist-vim

end)

