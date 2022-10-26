-- mason

-- :h mason-commands
--
-- :Mason                    | opens a graphical status window
-- :MasonInstall <pkg> ...   | installs/reinstalls the provided packages
-- :MasonUninstall <pkg> ... | uninstalls the provided packages
-- :MasonUninstallAll        | uninstalls all packages
-- :MasonLog                 | opens the mason.nvim log file in a new tab window

-- local status_ok, mason = pcall(require, "mason")
local status_ok, lspcfg = pcall(require, "mason-lspconfig")
if not status_ok then return end

-- auto-install servers

local servers = {
  "bashls",      -- bash
  "cssls",       -- css
  "dockerls",    -- dockerfile
  "elixirls",    -- elixir
  "html",        -- html
  "jsonls",      -- json
  "marksman",    -- markdown
  "solargraph",  -- ruby
  "sumneko_lua", -- lua
  "tailwindcss", -- tailwind
  "tsserver",    -- javascript and typescript
  "yamlls",      -- yaml
}

lspcfg.setup {
  ensure_installed = servers,
}

-- for _, name in pairs(servers) do
--   local server_is_found, server = mason.get_server(name)
--   -- if ! server_is_found then
--   --   print("NOT FOUND " .. name)
--   -- end
--   if server_is_found and not server:is_installed() then
--     print("Installing " .. name)
--     server:install()
--   end
-- end

-- server-specific configuration

-- mason.on_server_ready(function(server)
-- 	local opts = {
-- 		on_attach = require("user.lsp.handlers").on_attach,
-- 		capabilities = require("user.lsp.handlers").capabilities,
-- 	}
--
-- 	 if server.name == "jsonls" then
-- 	 	local jsonls_opts = require("user.lsp.settings.jsonls")
-- 	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
-- 	 end
--
-- 	 if server.name == "sumneko_lua" then
-- 	 	local sumneko_opts = require("user.lsp.settings.sumneko_lua")
-- 	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
-- 	 end
--
-- 	 if server.name == "elixirls" then
-- 	 	local elixirls_opts = require("user.lsp.settings.elixirls")
-- 	 	opts = vim.tbl_deep_extend("force", elixirls_opts, opts)
-- 	 end
--
-- 	-- This setup() function is exactly the same as lspconfig's setup function.
-- 	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- 	server:setup(opts)
-- end)

