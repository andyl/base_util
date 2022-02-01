-- term/base

vim.cmd [[

" auto init with insert mode
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave             term://* stopinsert
autocmd TermClose * :quit

" turn off line numbers in terminal mode
augroup TerminalStuff
  au!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

]]

