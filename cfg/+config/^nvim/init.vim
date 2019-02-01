" ----- vimrc for neovim

set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim

" -----------------------------------------------------------------
" ----- load base config
source ~/.vimrc_base

" -----------------------------------------------------------------
" ----- load base config
" ----- neovim-specific configuration
set lazyredraw

" turn off line numbers in terminal mode
augroup TerminalStuff
  au! 
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" ----- colorschemes
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox

" ----- terminal config
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave             term://* stopinsert

" ----- mouse
set mouse=a

