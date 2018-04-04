set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

set lazyredraw

" turn off line numbers in terminal mode
augroup TerminalStuff
  au! 
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
