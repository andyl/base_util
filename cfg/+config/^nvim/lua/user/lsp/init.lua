-- lsp/init

-- :h mason-commands
--
-- :Mason                    | opens a graphical status window
-- :MasonInstall <pkg> ...   | installs/reinstalls the packages
-- :MasonUninstall <pkg> ... | uninstalls the provided packages
-- :MasonUninstallAll        | uninstalls all packages
-- :MasonLog                 | opens mason.nvim log file in a new tab
--
-- :LspInfo                  | LSP info for current buffer

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then return end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
