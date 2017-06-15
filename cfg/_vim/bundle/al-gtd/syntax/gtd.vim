" AUTO COMMAND to create archive file
" autocmd BufWritePost,FileWritePost *.gtd :silent !pgbackup <afile>
autocmd VimLeave *.gtd :silent !pgbackup <afile>

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

" HELPER FUNCTION FOR INPUT MODE -----
function! CRMode()
  let first_char = matchstr(getline('.'), "^.")
  if first_char == '!' || first_char == '='
    execute "normal mm"
    %!pgsort
    execute "normal `mo=\<TAB>"
  else
    execute "normal! a\<CR>"
    startinsert
  end
endfunction

" GTD SYNTAX -----
syntax match gGroup     /{.*}/
syntax match gHandle    /\![A-z0-9][A-z0-9][A-z0-9][A-z0-9]/
syntax match gStatus    /=[IAWSTRXiawstrx]/ 
syntax match gScope     /:[a-z][a-z_]*/
syntax match gContext   /@[a-z][a-z]*/
syntax match gHPriority /\-[Hh]/
syntax match gMPriority /\-[Mm]/
syntax match gLPriority /\-[Ll]/
syntax match gContact   /#[A-Za-z][A-Za-z0-9\.\-\_]*/
syntax match gTitle     /+[^\&\#\:\@\*\=]*/
syntax match gNote      /*/
syntax match gDate      /&[^ ]*/

" SYNTAX HIGHLIGHTING -----
highlight gGroup     ctermfg=green
highlight gHandle    ctermfg=black
highlight gStatus    ctermfg=red  
highlight gScope     ctermfg=yellow 
highlight gContext   ctermfg=blue
highlight gHPriority ctermfg=black    ctermbg=red
highlight gMPriority ctermfg=black    ctermbg=blue
highlight gLPriority ctermfg=black    ctermbg=yellow
highlight gContact   ctermfg=magenta
highlight gTitle     ctermfg=white
highlight gNote      ctermfg=red       ctermbg=black
highlight gDate      ctermfg=cyan

" SHARED FUNCTIONS -----
function! SetMethod() range
ruby << END
$VERBOSE=nil
require '/home/aleak/util/pdev_util/gems/vgtd/lib/vgtd'
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

" UPDATE FUNCTIONS -----
function! UpdateCategory(mode) range
  call SetMethod()
  call UpdateTask("=", GetInput("New Category: "), a:mode)
endfunction

function! UpdateSpecificCategory(val, mode) range
  call SetMethod()
  call UpdateTask("=", a:val, a:mode)
endfunction

function! UpdateProject(mode) range
  call SetMethod()
  call UpdateTask(":", GetInput("New Project: "), a:mode)
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
  call UpdateTask("&", GetInput("New Date: "), a:mode)
endfunction

function! UpdateContact(mode) range
  call SetMethod()
  call UpdateTask("#", GetInput("New Contact: "), a:mode)
endfunction

" KEYMAPS -----
imap <CR> <ESC>:call CRMode()<CR>

" CHANGE KEYMAPS -----
vmap <leader>c= :call UpdateCategory("v")<cr>gv
nmap <leader>c= :call UpdateCategory("n")<cr>

vmap <leader>c: :call UpdateProject("v")<cr>gv
nmap <leader>c: :call UpdateProject("n")<cr>

vmap <leader>c@ :call UpdateContext("v")<cr>gv
nmap <leader>c@ :call UpdateContext("n")<cr>

vmap <leader>c- :call UpdatePriority("v")<cr>gv
nmap <leader>c- :call UpdatePriority("n")<cr>

vmap <leader>c/ :call UpdateDate("v")<cr>gv
nmap <leader>c/ :call UpdateDate("n")<cr>

vmap <leader>c# :call UpdateContact("v")<cr>gv
nmap <leader>c# :call UpdateContact("n")<cr>

vmap <leader>x :call UpdateSpecificCategory("X", "v")<cr>gv
nmap <leader>x :call UpdateSpecificCategory("X", "n")<cr>
vmap <leader>a :call UpdateSpecificCategory("A", "v")<cr>gv
nmap <leader>a :call UpdateSpecificCategory("A", "n")<cr>

vmap <leader>h :call DoUpdatePriority("H", "v")<cr>gv
vmap <leader>m :call DoUpdatePriority("M", "v")<cr>gv
vmap <leader>l :call DoUpdatePriority("L", "v")<cr>gv
nmap <leader>h :call DoUpdatePriority("H", "n")<cr>
nmap <leader>m :call DoUpdatePriority("M", "n")<cr>
nmap <leader>l :call DoUpdatePriority("L", "n")<cr>

" SORT KEYMAPS -----
vmap <leader>ss :!pgsort<cr>gv
nmap <leader>ss :%!pgsort<cr>`m

vmap <leader>s! :!pgsort handle<cr>gv
nmap <leader>s! :%!pgsort handle<cr>`m

vmap <leader>s= :!pgsort category<cr>gv
nmap <leader>s= :%!pgsort category<cr>`m

vmap <leader>s: :!pgsort project<cr>gv
nmap <leader>s: :%!pgsort project<cr>`m

vmap <leader>s@ :!pgsort context<cr>gv
nmap <leader>s@ :%!pgsort context<cr>`m

vmap <leader>s- :!pgsort priority<cr>gv
nmap <leader>s- :%!pgsort priority<cr>`m

vmap <leader>s/ :!pgsort date<cr>gv
nmap <leader>s/ :%!pgsort date<cr>`m

vmap <leader>s# :!pgsort contact<cr>gv
nmap <leader>s# :%!pgsort contact<cr>`m

" GROUP KEYMAPS -----
" vmap <leader>g! :!pggroup !<cr>gv
" nmap <leader>g! :%!pggroup !<cr>`m

vmap <leader>g= :!pggroup =<cr>gv
nmap <leader>g= :%!pggroup =<cr>`m

vmap <leader>g: :!pggroup :<cr>gv
nmap <leader>g: :%!pggroup :<cr>`m

vmap <leader>g@ :!pggroup @<cr>gv
nmap <leader>g@ :%!pggroup @<cr>`m

vmap <leader>g- :!pggroup -<cr>gv
nmap <leader>g- :%!pggroup -<cr>`m

vmap <leader>g# :!pggroup #<cr>gv
nmap <leader>g# :%!pggroup #<cr>`m
