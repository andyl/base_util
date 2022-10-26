-- mason

-- :h mason-commands
--
-- :Mason                    | opens a graphical status window
-- :MasonInstall <pkg> ...   | installs/reinstalls the provided packages
-- :MasonUninstall <pkg> ... | uninstalls the provided packages
-- :MasonUninstallAll        | uninstalls all packages
-- :MasonLog                 | opens the mason.nvim log file in a new tab
-- :LspInfo                  | show currently active LSP client

-- Mason log is in ~/.local/share/nvim/mason.log
-- LSP log is ~/.local/share/nvim/lsp.log

-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
-- https://github.com/neovim/nvim-lspconfig

local status_ok1, mason = pcall(require, "mason")
if not status_ok1 then return end

local status_ok2, ml_lspcfg = pcall(require, "mason-lspconfig")
if not status_ok2 then return end

local status_ok3, nv_lspcfg = pcall(require, "lspconfig")
if not status_ok3 then return end

-- start mason

mason.setup()

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

ml_lspcfg.setup {
  ensure_installed = servers,
}

-- handlers attach servers to buffers

ml_lspcfg.setup_handlers {
  function (server_name) -- default handler sets up all servers
    nv_lspcfg[server_name].setup {}
  end,
}

