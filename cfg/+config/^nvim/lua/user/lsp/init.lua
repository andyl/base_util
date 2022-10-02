-- lsp/init

-- Key Commands
-- :LspInstallInfo - list installed and available servers
-- :LspInstall     - install latest server
-- :LspInfo        - LSP info for current buffer

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then return end

require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
