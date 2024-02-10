-- Nav using bracket [ ]

-- TODO: Finish this

--[[
FROM 'UNIMPAIRED.VIM' BY TIM POPE
FILES (supplied as command-line arguments to Neovim)
- [ ] *[a*     |:previous|
- [ ] *]a*     |:next|
- [ ] *[A*     |:first|
- [ ] *]A*     |:last|
BUFFERS
- [x] *[b*     |:bprevious|
- [x] *]b*     |:bnext|
- [x] *[B*     |:bfirst|
- [x] *]B*     |:blast|
LOCATION LIST (local)
- [ ] *[l*     |:lprevious|
- [ ] *]l*     |:lnext|
- [ ] *[L*     |:lfirst|
- [ ] *]L*     |:llast|
- [ ] *[<C-L>* |:lpfile|
- [ ] *]<C-L>* |:lnfile|
QUICKFIX LIST (project wide)
- [x] *[q*     |:cprevious|
- [x] *]q*     |:cnext|
- [x] *[Q*     |:cfirst|
- [x] *]Q*     |:clast|
- [ ] *[<C-Q>* |:cpfile| (Note that <C-Q> only works in a terminal if you disable
- [ ] *]<C-Q>* |:cnfile| flow control: stty -ixon)
TAGS
- [ ] *[t*     |:tprevious|
- [ ] *]t*     |:tnext|
- [ ] *[T*     |:tfirst|
- [ ] *]T*     |:tlast|
- [ ] *[<C-T>* |:ptprevious|
- [ ] *]<C-T>* |:ptnext|
]]

local nl_opts = {
  mode    = "n",     -- NORMAL mode
  prefix  = "[",     -- left bracket
  buffer  = nil,     -- Give a buffer num for buffer local mapping
  silent  = true,    -- use `silent` when creating keymaps
  noremap = true,    -- use `noremap` when creating keymaps
  nowait  = true,    -- use `nowait` when creating keymaps
}

local nl_keymap = {
  ["b"] = {":bprevious<cr>",     "Buffers :bprevious"},
  ["B"] = {":bfirst<cr>",        "Buffers :bfirst"},
  ["t"] = {":tabprev<cr>",       "Tabs :tabprev"},
  ["T"] = {":tabfirst<cr>",      "Tabs :tabfirst"},
  ["q"] = {":cprevious<cr>",     "Quickfix :cprevious"},
  ["Q"] = {":cfirst<cr>",        "Quickfix :cfirst"}

}

if WhichKeyOk then WhichKey.register(nl_keymap, nl_opts) end

------------------------------------------------------------------------

local nr_opts = {
  mode    = "n",     -- NORMAL mode
  prefix  = "]",     -- left bracket
  buffer  = nil,     -- Give a buffer num for buffer local mapping
  silent  = true,    -- use `silent` when creating keymaps
  noremap = true,    -- use `noremap` when creating keymaps
  nowait  = true,    -- use `nowait` when creating keymaps
}

local nr_keymap = {
  ["b"] = {":bnext<cr>",     "Buffers :bnext"},
  ["B"] = {":blast<cr>",     "Buffers :blast"},
  ["t"] = {":tabnext<cr>",   "Tabs :tabnext"},
  ["T"] = {":tablast<cr>",   "Tabs :tablast"},
  ["q"] = {":cnext<cr>",     "Quickfix :cnext"},
  ["Q"] = {":clast<cr>",     "Quickfix :clast"}
}

if WhichKeyOk then WhichKey.register(nr_keymap, nr_opts) end

