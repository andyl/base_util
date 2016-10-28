#!/usr/bin/env bash

# search_ex_completion.bash

# Tab-completion for `search_ex`

# To install: copy this script to `/etc/bash_completion.d` (or equivalent)
#   eg `$ search_ex completion > /etc/bash_completion.d/search_ex_completion.bash`

_search_ex() {
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"

  case $COMP_CWORD in 
    1)
      local commands="$(compgen -W "$(search_ex all_commands)" -- "$word")"
      COMPREPLY=( $commands )
      ;;
    2)
      local words=("${COMP_WORDS[@]}")
      unset words[0]
      local cmd="${words[1]}"
      if [[ " $(search_ex cfg_commands) " =~ "$cmd" ]] ; then
        local completions=$(search_ex ls)
        COMPREPLY=( $(compgen -W "$completions" -- "$word") )
      fi
      ;;
  esac
}

complete -F _search_ex search_ex shx

