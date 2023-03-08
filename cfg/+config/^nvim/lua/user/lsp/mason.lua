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

-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
-- https://github.com/neovim/nvim-lspconfig

-- start mason

require'mason'.setup()

-- auto-install servers

local servers = {
  "bashls",       -- bash
  "cssls",        -- css
  "dockerls",     -- dockerfile
  "elixirls",     -- elixir
  "html",         -- html
  "jsonls",       -- json
  "lua_ls",       -- lua
  "marksman",     -- markdown
  "solargraph",   -- ruby
  "tailwindcss",  -- tailwind
  "tsserver",     -- javascript and typescript
  "yamlls",       -- yaml
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
  ["jsonls"] = function ()           -- custom settings for JSON
    server_config("jsonls")
  end,
  ["elixirls"] = function ()         -- custom settings for ELIXIR
    server_config("elixirls")
  end,
  ["tailwindcss"] = function ()      -- custom settings for TAILWIND
    server_config("tailwindcss")
  end,
}

