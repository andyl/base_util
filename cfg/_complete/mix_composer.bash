# Bash completion for composer's mix tasks, installed by `cb_std:completions:composer`.
#
# Completes addresses one segment at a time, from _build/composer/index,
# without starting the BEAM: steps (cb_std:setup:credo) for
# `mix composer.step.{run,show,help,edit}`, recipes (cb_wip/lv/base) for
# `mix composer.recipe.{run,show,help,edit}`, and listing stems (cb_wip/,
# cb_std:cluster:) for `mix composer.recipe.list` and `mix composer.step.list`.
# `mix composer.menu.{run,check}` complete a menu (cb_wip^phx), then its dishes;
# `mix composer.menu.{show,list}` go on through course and dish.
# `mix composer.search` completes its flags, `--kind`'s values and
# `--facet`'s keys; its free text completes nothing.
# A bare word completes to cookbook names and to the recipes or steps it
# names; a leading / or : is the project's own cookbook. Every other `mix`
# completion goes to mix_completions (https://hex.pm/packages/mix_completions)
# when it is loaded. Source this file after mix_completions' script.
#
# Hints once per session, on stderr, when the index is older than mix.lock
# or mix_completions' task cache is stale.

# Prints "(composer: MESSAGE)" on stderr, once per session for each KEY.
__composer_hint() {
  local guard=__composer_hinted_$1
  [[ -z ${!guard-} ]] || return 0
  printf -v "$guard" 1
  printf '\n(composer: %s)\n' "$2" >&2
}

# Sets the caller's `index` to the index path, or fails when it is missing
# or older than mix.lock. Not run in a subshell, so a hint's guard sticks.
__composer_index() {
  index="_build/composer/index"
  [[ -f mix.exs && -f $index ]] || return 1

  if [[ -f mix.lock && mix.lock -nt $index ]]; then
    __composer_hint index "the completion index is stale; run mix composer.index"
    return 1
  fi
}

# Hints when mix_completions' task cache is stale: in a project, older than
# mix.lock; elsewhere, the global cache older than the archives directory.
# A missing cache gives no hint.
__composer_mix_cache_check() {
  if [[ -f mix.exs ]]; then
    if [[ -f .mix_complete.cache && -f mix.lock && mix.lock -nt .mix_complete.cache ]]; then
      __composer_hint project_cache "mix task completions are stale; run mix complete"
    fi
  else
    local archives=${MIX_HOME:-$HOME/.mix}/archives
    local cache=${XDG_CACHE_HOME:-$HOME/.cache}/.mix_complete.cache
    if [[ -e $archives && -f $cache && $archives -nt $cache ]]; then
      __composer_hint global_cache "mix task completions are stale; run mix complete outside a project"
    fi
  fi
}

# The same program is in composer.zsh and composer.fish.
# -- segments.awk --
__composer_awk='
# Prints the completion candidates for ITEM, one segment at a time, as
# "nospace<TAB>candidate<TAB>description", nospace 1 after a chapter,
# directory, group, course or cookbook name. MODE is recipe, step,
# rlist (recipe.list stems), slist (step.list stems), menu (a menu),
# mshow (a menu, course or dish) or pick (a dish of the menu MENU).
BEGIN { FS = "\t" }
$1 == "self" { own = $2; next }
{ n++; kind[n] = $1; id[n] = $2; text[n] = $3 }
END {
  item = ITEM
  if (MODE == "pick") { picks(); exit }
  if (MODE == "menu" || MODE == "mshow") sep = "^"
  else sep = (MODE == "recipe" || MODE == "rlist") ? "/" : ":"
  first = substr(item, 1, 1)
  if (first == ".") exit
  root = 0
  if (first == "/" || first == ":" || first == "^") {
    if (first != sep || own == "") exit
    root = 1
    item = own item
  }

  if (index(item, "/") == 0 && index(item, ":") == 0 && index(item, "^") == 0) {
    for (i = 1; i <= n; i++) {
      if (kind[i] == "cookbook" && substr(id[i], 1, length(item)) == item) emit(id[i], text[i], 1)
    }
    if (MODE != "rlist" && MODE != "slist") {
      want = (MODE == "mshow") ? "menu" : MODE
      for (i = 1; i <= n; i++) {
        if (kind[i] != want) continue
        leaf = id[i]
        sub(/.*[\/:^]/, "", leaf)
        if (substr(leaf, 1, length(item)) == item) emit(leaf, id[i], 0)
      }
    }
    exit
  }

  if (MODE == "recipe") wanted = " recipe chapter dir "
  else if (MODE == "rlist") wanted = " chapter dir "
  else if (MODE == "step") wanted = " step group "
  else if (MODE == "menu") wanted = " menu "
  else if (MODE == "mshow") wanted = " menu course dish "
  else wanted = " group "

  # The item up to its last separator, and the cookbook part.
  p = item
  sub(/[^\/:^]*$/, "", p)
  if (substr(p, length(p), 1) != sep) exit
  for (i = 1; i <= n; i++) {
    if (index(wanted, " " kind[i] " ") == 0) continue
    if (substr(id[i], 1, length(item)) != item) continue
    rest = substr(id[i], length(p) + 1)
    if (rest == "") continue
    j = index(rest, sep)
    if (j > 0) emit(p substr(rest, 1, j), "", 1)
    else emit(p rest, text[i], 0)
  }
}

# The dishes of MENU: a bare key where it is unique in the menu, else course^.
function picks(m, found, matches, i, p, rest, at, key) {
  m = MENU
  if (substr(m, 1, 1) == "^") m = own m
  if (index(m, "^") == 0) {
    for (i = 1; i <= n; i++) {
      if (kind[i] != "menu") continue
      key = id[i]
      sub(/.*\^/, "", key)
      if (key == m) { found = id[i]; matches++ }
    }
    if (matches != 1) return
    m = found
  }
  p = m "^"
  for (i = 1; i <= n; i++) {
    if (kind[i] != "dish" || substr(id[i], 1, length(p)) != p) continue
    key = id[i]
    sub(/.*\^/, "", key)
    keys[key]++
  }
  for (i = 1; i <= n; i++) {
    if (kind[i] != "dish" || substr(id[i], 1, length(p)) != p) continue
    rest = substr(id[i], length(p) + 1)
    at = index(rest, "^")
    key = substr(rest, at + 1)
    if (index(item, "^") > 0 || keys[key] > 1) {
      if (substr(rest, 1, length(item)) != item) continue
      if (index(item, "^") > 0) emit(rest, text[i], 0)
      else emit(substr(rest, 1, at), "", 1)
    } else if (substr(key, 1, length(item)) == item) {
      emit(key, text[i], 0)
    }
  }
}

function emit(candidate, description, nospace) {
  if (root) candidate = substr(candidate, length(own) + 1)
  if (candidate in seen || candidate == "") return
  seen[candidate] = 1
  printf "%d\t%s\t%s\n", nospace, candidate, description
}
'
# -- end segments.awk --

# Sets the caller's `menu` to the first positional before the cursor, leaving it
# empty while the menu itself is being completed. '=' is in COMP_WORDBREAKS, so
# the value of --commit=run arrives as its own word.
__composer_menu_word() {
  local i skip=""
  menu=""
  for ((i = 2; i < COMP_CWORD; i++)); do
    if [[ -n $skip ]]; then
      skip=""
      continue
    fi

    case ${COMP_WORDS[i]} in
      --special | =) skip=1 ;;
      -*) ;;
      *)
        menu=${COMP_WORDS[i]}
        return 0
        ;;
    esac
  done
}

# Completes the current argument in MODE (recipe, step, rlist, slist, menu,
# mshow or pick). For pick, the caller's `menu` names the menu.
__composer_complete() {
  local mode=$1 index
  COMPREPLY=()
  # A word starting with / or . never falls back to filenames.
  compopt +o default 2>/dev/null
  __composer_index || return 0

  # ':' is in COMP_WORDBREAKS, so "cb_std:setup:cr" arrives as several words.
  # Rebuild the whole argument from the line instead (ids never contain spaces).
  local line=${COMP_LINE:0:COMP_POINT}
  local full=${line##* }

  # step.run takes a comma-separated list: complete the last item.
  local before="" item=$full
  if [[ $mode == step && $full == *,* ]]; then
    before=${full%,*},
    item=${full##*,}
  fi

  local nospace candidate all=1
  while IFS=$'\t' read -r nospace candidate _; do
    COMPREPLY+=("$before$candidate")
    [[ $nospace == 1 ]] || all=0
  done < <(awk -v MODE="$mode" -v ITEM="$item" -v MENU="${menu-}" "$__composer_awk" "$index")

  # A chapter, directory, group or cookbook name is completed further, so no
  # space after it.
  if [[ ${#COMPREPLY[@]} -gt 0 && $all == 1 ]]; then
    compopt -o nospace 2>/dev/null
  fi

  # Bash replaces only the text after the last ':', so drop everything up to
  # it from each candidate (what bash-completion's __ltrim_colon_completions
  # does), however many ':' the word has.
  if [[ $full == *:* ]]; then
    local prefix=${full%"${full##*:}"}
    local i
    for i in "${!COMPREPLY[@]}"; do
      COMPREPLY[i]=${COMPREPLY[i]#"$prefix"}
    done
  fi
}

# The facet keys of mix composer.search (Composer.Search.facet_keys/0).
__composer_facet_keys="kind cookbook chapter leaf launch frameworks capability tags provides requires host stability action phase"

# Completes mix composer.search: a flag, --kind's value or --facet's key.
__composer_search_complete() {
  local cur=${COMP_WORDS[COMP_CWORD]-} prev=${COMP_WORDS[COMP_CWORD-1]-}
  COMPREPLY=()

  case $prev in
    --kind) COMPREPLY=($(compgen -W "recipe step" -- "$cur")) ;;
    --facet)
      COMPREPLY=($(compgen -S = -W "$__composer_facet_keys" -- "$cur"))
      compopt -o nospace 2>/dev/null
      ;;
    *)
      if [[ $cur == -* ]]; then
        COMPREPLY=($(compgen -W "--facet --kind --leaf --no-leaf --counts --json" -- "$cur"))
      fi
      ;;
  esac
}

_composer_mix_complete() {
  local mode=""
  case ${COMP_WORDS[1]-} in
    composer.step.run | composer.step.show | composer.step.help | composer.step.edit) mode=step ;;
    composer.recipe.run | composer.recipe.show | composer.recipe.help | composer.recipe.edit | composer.recipe.graph | composer.recipe.command) mode=recipe ;;
    composer.recipe.list) mode=rlist ;;
    composer.step.list) mode=slist ;;
    composer.menu.run | composer.menu.check) mode=menu ;;
    composer.menu.show | composer.menu.list) mode=mshow ;;
  esac

  local menu=""
  if [[ $mode == menu && $COMP_CWORD -ge 2 ]]; then
    # A special has no address yet, so its value completes nothing.
    if [[ ${COMP_WORDS[COMP_CWORD-1]-} == --special ]]; then
      COMPREPLY=()
      compopt +o default 2>/dev/null
      return 0
    fi

    __composer_menu_word
    [[ -n $menu ]] && mode=pick
  fi

  if [[ ${COMP_WORDS[1]-} == composer.search && $COMP_CWORD -ge 2 ]]; then
    __composer_search_complete
  elif [[ -n $mode && $COMP_CWORD -ge 2 && ${COMP_WORDS[COMP_CWORD]} != -* ]]; then
    __composer_complete "$mode"
  elif declare -F _mix_complete_complete >/dev/null; then
    __composer_mix_cache_check
    _mix_complete_complete "$@"
  else
    COMPREPLY=()
    compopt -o default 2>/dev/null
  fi
}

complete -F _composer_mix_complete mix
