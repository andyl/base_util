" WLOG SYNTAX -----
syntax match wRoadmap   /^# ROADMAP.*/
syntax match wTitle     /^Title: Week beginning [012][0-9]-[01][0-9]-[0-3][0-9]$/
syntax match wDayStart  /^# \(MON\|TUE\|WED\|THU\|FRI\|SAT\|SUN\) [012][0-9]-[01][0-9]-[0-3][0-9].*/ 
syntax match wDayEnd    /^---$/  
syntax match wTaskStart /^## [0-2][0-9][0134][05].*/
syntax match wTaskEnd   /^\[\]$/
syntax match wCode      /^    .*/
syntax match wCode      /\`.*\`/
syntax match wTODO      /TODO:/
syntax match wDONE      /DONE:/

syntax match wStatus    /=[A-Z]\+/
syntax match wScope     /\:[a-z\_\-]\+/
syntax match wContext   /@[a-z]\+/
syntax match wContact   /\#[a-z]\+/
syntax match wDate      /\~[a-z0-9]\+/

" FOLDING -----
syn region levelOne 
     \  start=/^# \(ROADMAP\|MON\|TUE\|WED\|THU\|FRI\|SAT\|SUN\)/ 
     \  end=/^---$/ fold contains=wRoadmap,wDayStart,wDayEnd,wCode,wTODO,wDONE,wStatus,wScope,wContext,wContact,wDate keepend

syn region levelTwo start=/^## / end=/^\[\]$/ 
     \ fold contains=wTaskStart,wTaskEnd,wCode,wTODO,wDONE,wStatus,wScope,wContext,wContact,wDate
     \ contained extend keepend containedin=levelOne

" FOLDING METHODS -----
set foldenable
set foldmethod=syntax

" HOT-KEYS -----
nmap <space> za
nmap <C-t>d iDONE: <esc>
nmap <C-t>t iTODO: 
imap <C-t>d DONE: 
imap <C-t>t TODO: 
nmap <C-t>x :s/[TD]O[DN][OE]\: //g<cr>:noh<cr>
imap <C-t>x <esc>:s/[TD]O[DN][OE]\: //g<cr>:noh<cr>i

nmap <C-t>s :r !w_timestamp<cr>kddA
imap <C-t>s <esc>:r !w_timestamp<cr>kddA

nmap <C-h>d :r !w_date<cr>k$
imap <C-h>d <esc>:r !w_date<cr>k$
nmap <C-h>t :r !w_time<cr>k$a
imap <C-h>t <esc>:r !w_time<cr>k$a

" TEXT OBJECTS -----
" see http://vim.wikia.com/wiki/Creating_new_text_objects
" need: 'day' text object and a 'journal' text object (inner and outer)
" rewrite to use 'textobj-user'
" vnoremap ad :TBD
" omap ad :TBD

