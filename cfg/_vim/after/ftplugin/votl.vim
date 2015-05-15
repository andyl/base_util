" Vim Outliner Customizations
"

let maplocalleader = "\\"      " local leader character

setlocal tabstop=2
setlocal shiftwidth=2

set t_Co=256       " force terminal to use 256 colors
colorscheme otl    " use the 'org' colorscheme (defined in ~/.vim/colors/org.vim)

nmap <space> za

setlocal foldlevel=0  " start with everything closed...

