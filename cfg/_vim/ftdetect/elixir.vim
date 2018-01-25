fun! s:DetectElixir()
  if getline(1) == '#!/usr/local/bin/mix run'
    set ft=elixir
  endif
endfun

autocmd BufNewFile,BufRead * call s:DetectElixir()

