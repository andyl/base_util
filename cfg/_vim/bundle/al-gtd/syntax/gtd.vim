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
function! UpdateTask(leader, value) 
  let inline=getline(line("."))
  let argstr="\"".shellescape(l:inline)."|".a:leader."|".a:value."\""
  execute '.!pgline ' . l:argstr
endfunction

function! GetInput(prompt) range
  call inputsave()
  let newval = input(a:prompt)
  call inputrestore()
  return newval
endfunction

" UPDATE FUNCTIONS -----
function! UpdateStatus() range
  call UpdateTask("=", GetInput("New Status: "))
endfunction

function! UpdateScope() range
  call UpdateTask(":", GetInput("New Scope: "))
endfunction

function! UpdateContext() range
  call UpdateTask("@", GetInput("New Context: "))
endfunction

function! UpdatePriority() range
  call UpdateTask("-", GetInput("New Priority: "))
endfunction

function! UpdateDate() range
  call UpdateTask("$", GetInput("New Date: "))
endfunction

function! UpdateContact() range
  call UpdateTask("#", GetInput("New Contact: "))
endfunction

" CHANGE KEYMAPS -----
" TODO: make this handle multi-line properly
vmap <leader>c= :call UpdateStatus()<cr>gv
nmap <leader>c= :call UpdateStatus()<cr>

vmap <leader>c: :call UpdateScope()<cr>gv
nmap <leader>c: :call UpdateScope()<cr>

vmap <leader>c@ :call UpdateContext()<cr>gv
nmap <leader>c@ :call UpdateContext()<cr>

vmap <leader>c- :call UpdatePriority()<cr>gv
nmap <leader>c- :call UpdatePriority()<cr>

vmap <leader>c$ :call UpdateDate()<cr>gv
nmap <leader>c$ :call UpdateDate()<cr>

vmap <leader>c# :call UpdateContact()<cr>gv
nmap <leader>c# :call UpdateContact()<cr>

vmap <leader>x :call UpdateTask("=", "X")<cr>gv
nmap <leader>x :call UpdateTask("=", "X")<cr>

vmap <leader>a :call UpdateTask("=", "A")<cr>gv
nmap <leader>a :call UpdateTask("=", "A")<cr>

vmap <leader>h :call UpdateTask("-", "H")<cr>gv
vmap <leader>m :call UpdateTask("-", "M")<cr>gv
vmap <leader>l :call UpdateTask("-", "L")<cr>gv

nmap <leader>h :call UpdateTask("-", "H")<cr>
nmap <leader>m :call UpdateTask("-", "M")<cr>
nmap <leader>l :call UpdateTask("-", "L")<cr>

" SORT KEYMAPS -----
vmap <leader>ss :!pgsort<cr>gv
nmap <leader>ss mm:%!pgsort<cr>`mmm

vmap <leader>s. :!pgsort handle<cr>gv
nmap <leader>s. mm:%!pgsort handle<cr>`mmm

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

