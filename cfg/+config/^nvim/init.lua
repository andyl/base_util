-- Neovim Config

require "user.options"       -- config options
require "user.vimcmd"        -- vim commands (autocommands)
require "user.packer_boot"   -- packer installation
require "user.packer_list"   -- packer plugin specification
require "user.packer_util"   -- packer plugin utilities
require "user.plug"          -- plugin configuration
require "user.pane"          -- pane utilities (resizing)
require "user.term"          -- terminal configuration
require "user.key"           -- keymap setup
require "user.lsp"           -- lsp configuration

-- hack/workaround to fix broken heex highlighting
-- https://github.com/elixir-editors/vim-elixir/issues/562
-- vim.api.nvim_exec(
-- [[
--   au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
--   au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
--   au BufRead,BufNewFile mix.lock set filetype=elixir
-- ]], false)

