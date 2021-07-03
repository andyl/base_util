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
Plug 'andyl/rfxi_nvim'
Plug 'andyl/al-gtd'
Plug 'andyl/al-worklog'
" -- ALE (Async Lint Engine) -----
" Plug 'w0rp/ale'
" -- COC (Command of Completion) -----
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

" === TREESITTER

"lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" require("nvim-treesitter.configs").setup {
"     ensure_installed = { "lua", "python", "bash", "yaml", "json", "ruby",
"     "javascript", "rust", "css", "scss", "html", "erlang", "elixir" },
"     ignore_install = { "javascript" },
"     highlight = {
"             enable = true,
"     },
"     indent = {
"             enable = true,
"     },
" }

" === TELESCOPE

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" === MISC
set lazyredraw

" === MOUSE
set mouse=a

" === COLORSCHEMES
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox

" === TERMINAL 
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave             term://* stopinsert

" turn off line numbers in terminal mode
augroup TerminalStuff
  au! 
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" terminal navigate
tnoremap <c-h> <C-\><C-n><C-w>h
tnoremap <c-j> <C-\><C-n><C-w>j
tnoremap <c-k> <C-\><C-n><C-w>k
tnoremap <c-l> <C-\><C-n><C-w>l

" easily escape terminal
tnoremap <leader><esc> <C-\><C-n>

" toggle terminal
nmap <leader>tv :vertical botright Ttoggle<cr><C-w>l
nmap <leader>ts :rightbelow Ttoggle<cr><C-w>j

" disable python2 provider
let g:loaded_python_provider=0

" === ZOOM STATE ON STATUS LINE
fun! SetZoomState()
  if g:airline_section_y != "ZOOM"
    let g:orig_zoom_state = g:airline_section_y
    let g:airline_section_y = "ZOOM"
    let g:airline_theme     = 'light'
  else
    let g:airline_section_y = g:orig_zoom_state
    let g:airline_theme = 'luna'
    let g:orig_zoom_state = ""
  endif
  AirlineRefresh
  AirlineRefresh
endfun

if !exists("g:ZoomWinFuncRef")
 let g:ZoomWinFuncRef = function("SetZoomState")
endif
 
" === VIM-AIRLINE 
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_theme = 'papercolor'
let g:airline_symbols_ascii = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#bufferline#enabled = 0
nmap <leader>1 :bl\|1bn<cr>
nmap <leader>2 :bl\|2bn<cr>
nmap <leader>3 :bl\|3bn<cr>
nmap <leader>4 :bl\|4bn<cr>
nmap <leader>5 :bl\|5bn<cr>
nmap <leader>6 :bl\|6bn<cr>
nmap <leader>7 :bl\|7bn<cr>
nmap <leader>8 :bl\|8bn<cr>
nmap <leader>9 :bl\|9bn<cr>

