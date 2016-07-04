#!/usr/bin/env bash

tmux_version () {
  tmux -V | cut -d' ' -f2
}

tmux_gt_20 () {
  [[ `tmux_version` > 2.0 ]] && return 0 
  return 1
}

tmux_lte_20 () {
  [[ `tmux_version` < 2.0 || `tmux_version` == 2.0 ]] && return 0
  return 1
}

load_21 () {
  echo LOADING 21
  tmux source-file ~/.tmux_21.conf
}

load_20 () {
  echo LOADING 20
  tmux source-file ~/.tmux_20.conf
}

tmux_gt_20  && load_21
tmux_lte_20 && load_20
