" Vim Outliner Customizations
" vimoutliner
"

let maplocalleader = "\\"      " local leader character

setlocal tabstop=2
setlocal shiftwidth=2

set t_Co=256       " force terminal to use 256 colors
colorscheme otl    " use the 'otl' colorscheme (defined in ~/.vim/colors/otl.vim)

nmap <space> za

" see https://github.com/vimoutliner/vimoutliner/issues/114
setlocal foldlevel=1  " start with everything closed...

