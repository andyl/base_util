" AUTO COMMAND to create archive file
augroup onexit
  autocmd!
  autocmd VimLeave *.gtd :silent !pgbackup <afile>
augroup END

" GTD SYNTAX -----
syntax match gGroup     /{.*}/
syntax match gHandle    /\![a-z0-9][a-z0-9][a-z0-9][a-z0-9]/
syntax match gStatus    /=[IAWSTRXiawstrx]/ 
syntax match gScope     /\ :[a-z][a-z_]*/
syntax match gContext   / @[a-z][a-z]*/
syntax match gHPriority /\-[Hh]/
syntax match gMPriority /\-[Mm]/
syntax match gLPriority /\-[Ll]/
syntax match gContact   /#[A-Za-z][A-Za-z0-9\.\-\_]*/
syntax match gTitle     /+[^\^\~\$\&\#\:\@\*\=]*/
syntax match gAppend    /\^[^\+\$\&\#\@\*\=]*/
syntax match gNote      /*/
syntax match gDate      /\~[^ ]*/

" SHARED FUNCTIONS -----

" update a task-line
function! UpdateTaskL(leader, value) 
  let inline=getline(line("."))
  let argstr=l:inline."|".a:leader."|".a:value
  execute '.!pgline ' . shellescape(l:argstr, "x")
endfunction

" update a task-range
function! UpdateTaskR(leader, value) range
  '<,'>call UpdateTaskL(a:leader, a:value)
endfunction

function! GetInput(prompt) range
  let g:in_prompt = a:prompt
  call inputsave()
  let newval = input(a:prompt)
  call inputrestore()
  return newval
endfunction

" CHANGE KEYMAPS -----
vmap <leader>c= :call UpdateTaskR("=", GetInput("New Status: "))<cr>gv
nmap <leader>c= :call UpdateTaskL("=", GetInput("New Status: "))<cr>

vmap <leader>c: :call UpdateTaskR(":", GetInput("New Scope: "))<cr>gv
nmap <leader>c: :call UpdateTaskL(":", GetInput("New Scope: "))<cr>

vmap <leader>c@ :call UpdateTaskR("@", GetInput("New Context: "))<cr>gv
nmap <leader>c@ :call UpdateTaskL("@", GetInput("New Context: "))<cr>

vmap <leader>c- :call UpdateTaskR("-", GetInput("New Priority: "))<cr>gv
nmap <leader>c- :call UpdateTaskL("-", GetInput("New Priority: "))<cr>

vmap <leader>c$ :call UpdateTaskR("$", GetInput("New Date: "))<cr>gv
nmap <leader>c$ :call UpdateTaskL("$", GetInput("New Date: "))<cr>

vmap <leader>c# :call UpdateTaskR("#", GetInput("New Contact: "))<cr>gv
nmap <leader>c# :call UpdateTaskL("#", GetInput("New Contact: "))<cr>

vmap <leader>x :call UpdateTaskL("=", "X")<cr>gv
nmap <leader>x :call UpdateTaskL("=", "X")<cr>

vmap <leader>a :call UpdateTaskL("=", "A")<cr>gv
nmap <leader>a :call UpdateTaskL("=", "A")<cr>

vmap <leader>h :call UpdateTaskL("-", "H")<cr>gv
vmap <leader>m :call UpdateTaskL("-", "M")<cr>gv
vmap <leader>l :call UpdateTaskL("-", "L")<cr>gv

nmap <leader>h :call UpdateTaskL("-", "H")<cr>
nmap <leader>m :call UpdateTaskL("-", "M")<cr>
nmap <leader>l :call UpdateTaskL("-", "L")<cr>

" SORT KEYMAPS -----
vmap <leader>ss :!pgsort<cr>gv
nmap <leader>ss mm:%!pgsort<cr>`mmm

vmap <leader>s! :!pgsort handle<cr>gv
nmap <leader>s! mm:%!pgsort handle<cr>`mmm

vmap <leader>s= :!pgsort category<cr>gv
nmap <leader>s= mm:%!pgsort category<cr>`mmm

vmap <leader>s: :!pgsort project<cr>gv
nmap <leader>s: mm:%!pgsort project<cr>`mmm

vmap <leader>s@ :!pgsort context<cr>gv
nmap <leader>s@ mm:%!pgsort context<cr>`mmm

vmap <leader>s- :!pgsort priority<cr>gv
nmap <leader>s- mm:%!pgsort priority<cr>`mmm

vmap <leader>s$ :!pgsort date<cr>gv
nmap <leader>s$ mm:%!pgsort date<cr>`mmm

vmap <leader>s# :!pgsort contact<cr>gv
nmap <leader>s# mm:%!pgsort contact<cr>`mmm

" GROUP KEYMAPS -----
vmap <leader>g. :!pggroup .<cr>gv
nmap <leader>g. mm:%!pggroup .<cr>`mmm

vmap <leader>g= :!pggroup =<cr>gv
nmap <leader>g= mm:%!pggroup =<cr>`mmm

vmap <leader>g: :!pggroup :<cr>gv
nmap <leader>g: mm:%!pggroup :<cr>`mmm

vmap <leader>g@ :!pggroup @<cr>gv
nmap <leader>g@ mm:%!pggroup @<cr>`mmm

vmap <leader>g- :!pggroup -<cr>gv
nmap <leader>g- mm:%!pggroup -<cr>`mmm

vmap <leader>g# :!pggroup #<cr>gv
nmap <leader>g# mm:%!pggroup #<cr>`mmm

" NOTE FUNCTION -----
function! OpenNote() range
  let line   = getline(line('.'))
  let handle = matchstr(line,'\!\zs[^ ]*\ze')
  if handle == ""
    return ""
  end
  execute "normal zt"
  execute "only"
  execute "split notes/" . handle . ".md"
endfunction

" NOTE KEYMAPS -----
vmap <leader>n :call OpenNote()<cr>gv
nmap <leader>n :call OpenNote()<cr>

