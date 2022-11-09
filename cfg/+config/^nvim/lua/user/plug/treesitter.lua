-- plug/treesitter
-- cmds - :TSUpdate | :TSConfigInfo | :TSInstallInfo | :TSInstallSync

require'nvim-treesitter.configs'.setup{
  ensure_installed = {
    "bash",
    "css",
    "eex",
    "elixir",
    "erlang",
    "heex",
    "html",
    "javascript",
    "json",
    "ledger",
    "lua",
    "markdown",
    "query",
    "ruby",
    "rust",
    "scss",
    "toml",
    "vim",
    "yaml",
    "zig",
  },
  sync_install = true,
  auto_install = true,
  ignore_install = { },
  highlight = {
    enable = true,
    disable = { },
    additional_vim_regex_highlighting = false,
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
}
