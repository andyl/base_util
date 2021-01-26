" ----- vimrc for neovim

set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim

" ----- load base config
source ~/.vimrc_base

" ----- misc
set lazyredraw

" ----- mouse
set mouse=a

" ----- colorschemes
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox

" ----- terminal 
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

