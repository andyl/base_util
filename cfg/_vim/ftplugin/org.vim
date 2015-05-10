" ORG Mode (Vim-OrgMode) Customizations

let maplocalleader = "\\"      " local leader character

let g:org_heading_shade_leading_stars = 0
let g:org_todo_keywords = [['TODO', 'DONE']]
let g:org_todo_keyword_faces = [
  \ ['TODO', [':foreground yellow', ':background none', ':weight bold']],
  \ ['DONE', [':foreground green' , ':background none', ':weight bold']]]

" use <Space> as folding toggle
nmap <silent> <Space> <Plug>OrgToggleFoldingNormal

set t_Co=256       " force terminal to use 256 colors
colorscheme org    " use the 'org' colorscheme (defined in ~/.vim/colors/org.vim)

