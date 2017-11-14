" AUTO COMMAND to create archive file
augroup onexit
  autocmd!
  autocmd VimLeave *.gtd :silent !pgbackup <afile>
augroup END

" SNIPPET HELPER FUNCTIONS -----
function! GetContext()
  let x = getline(line('.')-1)
  return matchstr(x,'@\zs[^ ]*\ze')
endfunction

function! GetScope()
  let x = getline(line('.')-1)
  return matchstr(x,':\zs[^ ]*\ze')
endfunction

function! GetStatus()
  let x = getline(line('.')-1)
  let y = matchstr(x,'=\zs[IAWSTRX]*\ze')
  if y == ""
    return "I"
  else
    return y
  end
endfunction

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
function! SetMethod() range
ruby << END
$VERBOSE=nil
require 'vgtd'
def update_field(string, leader, newval)
  task = Gtask.new(string)
  task.update_field(leader, newval)
  task.output
end
END
endfunction

function! GetInput(prompt) range
call inputsave()
let newval = input(a:prompt)
call inputrestore()
return newval
endfunction

function! UpdateTask(leader, value, mode) range
  if a:mode == "v"
    '<,'>rubydo $_ = update_field($_, VIM::evaluate("a:leader"), VIM::evaluate("a:value"))
  else
    .,.rubydo $_ = update_field($_, VIM::evaluate("a:leader"), VIM::evaluate("a:value"))
  end
endfunction

function! UpTask(leader, value) range
  let inline=getline(line("."))
  let argstr="\"\\".l:inline."|".a:leader."|".a:value."\""
  execute '.!pgline ' . l:argstr
endfunction

" UPDATE FUNCTIONS -----
function! UpdateStatus(mode) range
  call SetMethod()
  call UpdateTask("=", GetInput("New Status: "), a:mode)
endfunction

function! UpdateSpecificStatus(val, mode) range
  call SetMethod()
  call UpdateTask("=", a:val, a:mode)
endfunction

function! UpdateScope(mode) range
  call SetMethod()
  call UpdateTask(":", GetInput("New Scope: "), a:mode)
endfunction

function! UpdateContext(mode) range
  call SetMethod()
  call UpdateTask("@", GetInput("New Context: "), a:mode)
endfunction

function! UpdatePriority(mode) range
  call SetMethod()
  call UpdateTask("-", GetInput("New Priority: "), a:mode)
endfunction

function! DoUpdatePriority(val, mode) range
  call SetMethod()
  call UpdateTask("-", a:val, a:mode)
endfunction

function! UpdateDate(mode) range
  call SetMethod()
  call UpdateTask("$", GetInput("New Date: "), a:mode)
endfunction

function! UpdateContact(mode) range
  call setmethod()
  call updatetask("#", getinput("new contact: "), a:mode)
endfunction

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

" CHANGE KEYMAPS -----
vmap <leader>c= :call UpdateStatus("v")<cr>gv
nmap <leader>c= :call UpdateStatus("n")<cr>

vmap <leader>c: :call UpdateScope("v")<cr>gv
nmap <leader>c: :call UpdateScope("n")<cr>

vmap <leader>c@ :call UpdateContext("v")<cr>gv
nmap <leader>c@ :call UpdateContext("n")<cr>

vmap <leader>c- :call UpdatePriority("v")<cr>gv
nmap <leader>c- :call UpdatePriority("n")<cr>

vmap <leader>c$ :call UpdateDate("v")<cr>gv
nmap <leader>c$ :call UpdateDate("n")<cr>

vmap <leader>c# :call UpdateContact("v")<cr>gv
nmap <leader>c# :call UpdateContact("n")<cr>

vmap <leader>x :call UpdateSpecificStatus("X", "v")<cr>gv
nmap <leader>x :call UpdateSpecificStatus("X", "n")<cr>
vmap <leader>a :call UpdateSpecificStatus("A", "v")<cr>gv
nmap <leader>a :call UpdateSpecificStatus("A", "n")<cr>

vmap <leader>h :call DoUpdatePriority("H", "v")<cr>gv
vmap <leader>m :call DoUpdatePriority("M", "v")<cr>gv
vmap <leader>l :call DoUpdatePriority("L", "v")<cr>gv
nmap <leader>h :call DoUpdatePriority("H", "n")<cr>
nmap <leader>m :call DoUpdatePriority("M", "n")<cr>
nmap <leader>l :call DoUpdatePriority("L", "n")<cr>

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
