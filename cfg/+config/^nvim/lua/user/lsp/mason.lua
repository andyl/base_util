-- mason

-- :h mason-commands
--
-- :Mason                    | opens a graphical status window
-- :MasonInstall <pkg> ...   | installs/reinstalls the provided packages
-- :MasonUninstall <pkg> ... | uninstalls the provided packages
-- :MasonUninstallAll        | uninstalls all packages
-- :MasonLog                 | opens the mason.nvim log file in a new tab
-- :LspInfo                  | show currently active LSP client
-- :LspInstall               | install lsp server
-- :LspUninstall             | uninstall lsp server

-- Mason log | ~/.local/state/nvim/mason.log
-- LSP log   | ~/.local/state/nvim/lsp.log

-- MASON USES LSPCONFIG:
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--
-- LSPCONFIG HELP:
-- :help lsp-config
--
-- EXAMPLE LSP config:
-- https://github.com/megalithic/dotfiles/blob/94cce5036d8fc19c74b7a259f084560246194fe5/config/nvim/lua/mega/plugins/lsp/servers.lua#L477-L546
-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
--

require'mason'.setup()

-- auto-install servers

local servers = {
  "bashls",      -- bash
  "cssls",       -- css
  "dockerls",    -- dockerfile
  "elixirls",    -- elixir
  "emmet_ls",    -- emmet
  "html",        -- html
  "jsonls",      -- json
  "marksman",    -- markdown
  "solargraph",  -- ruby
  "sumneko_lua", -- lua
  "sqlls",       -- sql
  "tailwindcss", -- tailwind
  "tsserver",    -- javascript and typescript
  "yamlls",      -- yaml
}

require'mason-lspconfig'.setup {
  ensure_installed = servers,
}

-- handlers attach servers to buffers

local function server_config(server)
  local tgt = "user.lsp.settings." .. server
  local opts = require(tgt)
  require"lspconfig"[server].setup(opts)
end

require'mason-lspconfig'.setup_handlers {
  function (server_name) -- default handler sets up all servers
    require"lspconfig"[server_name].setup {}
  end,
  ["sumneko_lua"] = function ()           -- custom settings for LUA
    server_config("sumneko_lua")
  end,
  ["jsonls"] = function ()           -- custom settings for JSON
    server_config("jsonls")
  end,
  ["elixirls"] = function ()         -- custom settings for ELIXIR
    server_config("elixirls")
  end,
}

