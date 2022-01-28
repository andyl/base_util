" === VIMRC FOR NEOVIM

" === PATHOGEN PLUGIN MANAGER 
" LOADS CUSTOM PLUGINS IN ~/.vim/bundle ...
call pathogen#runtime_append_all_bundles()   
call pathogen#helptags()

" === VIM-PLUG - PLUGIN MANAGER
" Cmds - :PlugInstall / :PlugClean / :PlugStatus / :PlugUpdate / :PlugUpgrade
" Docs at http://github.com/junegunn/vim-plug 
call plug#begin('~/.vim/plugged')

" -- MISC -----
Plug 'andyl/nvls'
Plug 'andyl/rfx.nvim'
Plug 'andyl/al-gtd'
Plug 'andyl/al-worklog'
" -- ALE (Async Lint Engine) -----
" Plug 'w0rp/ale'
" -- COC (Command of Completion) -----
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" -- TREESITTER -----
" Plug 'nvim-treesitter/nvim-treesitter'   " AST generator
" Plug 'nvim-treesitter/playground'        " AST browser
" Plug 'nvim-treesitter/nvim-treesitter-textobjects' 
" -- TELESCOPE -----
Plug 'nvim-lua/popup.nvim'               " nvim-lua utility library
Plug 'nvim-lua/plenary.nvim'             " nvim-lua utility library
Plug 'nvim-telescope/telescope.nvim'     " telescope fuzzy-finder
" -- FZF -----
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'lvht/fzf-mru'
" -- NERDTREE ----- 
Plug 'scrooloose/nerdtree'               " file browser
Plug 'dsimidzija/vim-nerdtree-ignore'    " file browser
Plug 'vim-scripts/nerdtree-ack'          " search from directory
" -- SEARCH AND NAV ----- 
Plug 'mileszs/ack.vim'                   " file search
Plug 'tpope/vim-projectionist'           " alternate file nav
Plug 'andyl/fuzzy-projectionist.vim'     " fzf meets projectionist (eg :Fmodel)
" -- TEXT MANIPULATION -----
Plug 'vim-scripts/tComment'              " toggle comments on/off
Plug 'kana/vim-textobj-user'             " customikzable text objects
Plug 'mattn/vim-textobj-url'             " au/iu
Plug 'tpope/vim-surround'                " edit containing objects
Plug 'tpope/vim-repeat'                  " repeat support for plugins
" -- LANG JSON -----
Plug 'tpope/vim-jdaddy'                  " JSON text objects and formatting
" -- LANG ELIXIR -----
Plug 'powerman/vim-plugin-AnsiEsc'       " docco with ANSI colors
Plug 'elixir-editors/vim-elixir'         " filetype detection
Plug 'mattreduce/vim-mix'                " mix helpers
Plug 'andyl/vim-snipmate-elixir'         " snippets for elixir
Plug 'andyl/vim-projectionist-elixir'    " elixir file navigation
Plug 'andyl/vim-textobj-elixir'          " elixir text objects
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
" -- LANG RUBY ----- 
Plug 'vim-ruby/vim-ruby'                 " syntax highlighting
Plug 'andyl/vim-projectionist-ruby'      " ruby file navigation
Plug 'nelstrom/vim-textobj-rubyblock'    " ruby text objects
Plug 'bronson/vim-ruby-block-conv'       " toggle {} to begin/end
Plug 'andyl/vim-snipmate-ruby'           " snippets for ruby
" -- LANG JAVASCRIPT -----
Plug 'mxw/vim-jsx'                       " ReactJS/JSX
Plug 'kchmck/vim-coffee-script'          " coffeescript
Plug 'tomlion/vim-solidity'              " solidity
Plug 'pangloss/vim-javascript'           " javascript
Plug 'evanleck/vim-svelte'               " svelte
" -- LANG CRYSTAL -----
Plug 'rhysd/vim-crystal'                 " syntax highlighting
" -- LANG HTML -----
Plug 'mattn/emmet-vim'                   " HTML snippets
" -- LANG RUST -----
Plug 'rust-lang/rust.vim'                " syntax highlighting
" -- LEDGER -----    
Plug 'ledger/vim-ledger'                 " ledger-cli accounting
" -- GRAPHQL -----    
Plug 'jparise/vim-graphql'               " graphql syntax highlighting
" -- CODING UTILITIES -----
Plug 'milkypostman/vim-togglelist'       " toggle quicklist and location list
Plug 'tpope/vim-unimpaired'              " jump leading/trailing paren
Plug 'tmhedberg/matchit'                 " % matching
Plug 'vim-scripts/SyntaxRange'           " vimdeck syntax highlighting
Plug 'liuchengxu/vim-which-key'          " shows key mappings
Plug 'janko/vim-test'                    " test runner
" -- EDITING UTILS -----
Plug 'dhruvasagar/vim-table-mode'        " vim table mode
Plug 'junegunn/vim-easy-align'           " column alignment
" -- FILE FORMATS -----
Plug 'vimoutliner/vimoutliner'           " outline files
Plug 'pearofducks/ansible-vim'           " ansible yaml files
Plug 'slim-template/vim-slim'            " slim files
Plug 'jtratner/vim-flavored-markdown'    " markdown files
" -- TMUX/TERMINAL -----
Plug 'benmills/vimux'                    " tmux integration
Plug 'kassio/neoterm'                    " terminal management
" -- COLORSCHEMES -----
Plug 'junegunn/seoul256.vim'             " seoul256
Plug 'NLKNguyen/papercolor-theme'        " PaperColor
Plug 'noahfrederick/vim-hemisu'          " hemisu 
Plug 'sjl/badwolf'                       " badwolf
Plug 'tomasr/molokai'                    " molokai
Plug 'morhetz/gruvbox'                   " gruvbox
" -- LAYOUTS -----
Plug 'vim-airline/vim-airline'           " status bar
Plug 'vim-airline/vim-airline-themes'    " vim-airline themes
Plug 'andyl/zoomwintab.vim'              " pane zooming
Plug 'kshenoy/vim-signature'             " show marks
" -- MISC -----
Plug 'terryma/vim-multiple-cursors'      " multiple cursors
Plug 'itchyny/calendar.vim'              " vim calendars
Plug 'tpope/vim-fugitive'                " git integration
Plug 'vim-scripts/bats.vim'              " bats editing
" Plug 'gillyb/stable-windows'             " no window scroll on split
Plug 'mattn/gist-vim'                    " post github gists
Plug 'mattn/webapi-vim'                  " required by gist-vim

call plug#end()

" === PATHS

set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim

" === LOAD BASE CONFIG
source ~/.vimrc_base

