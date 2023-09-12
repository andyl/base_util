-- Neovim Config

require "user.options"       -- config options
require "user.vimcmd"        -- vim commands (autocommands)
require "user.lazy_boot"     -- lazy installation
require "user.lazy_list"     -- lazy plugin specifications
-- require "user.packer_boot"   -- packer installation
-- require "user.packer_list"   -- packer plugin specification
-- require "user.packer_util"   -- packer plugin utilities
require "user.plug"          -- plugin configuration
require "user.pane"          -- pane utilities (resizing)
require "user.term"          -- terminal configuration
require "user.key"           -- keymap setup
require "user.lsp"           -- lsp configuration
require "user.filetypes"     -- filetype detection

