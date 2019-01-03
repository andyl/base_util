#!/usr/bin/env bash

# dkb is a function that starts a bash prompt for a container
# dkb <container_name>
# this provides command-completion for the container name

function _dkb() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts="$(docker ps --format '{{.Names}}' | paste -sd ' ' -)"

  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
  return 0
}

complete -F _dkb dkb
