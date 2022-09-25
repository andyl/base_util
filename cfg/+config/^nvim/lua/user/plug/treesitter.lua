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
}
