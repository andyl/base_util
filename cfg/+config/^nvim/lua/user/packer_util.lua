-- packer_util - Packer configuration and customization

if not PackerOk then return end

-- Autocommand that reloads neovim whenever you save the plugins.lua file

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_list.lua source <afile> | PackerSync
  augroup end
]]

-- Have packer use a popup window

-- Packer.init {
--   display = {
--     open_fn = function()
--       return require("packer.util").float { border = "rounded" }
--     end,
--   },
-- }

-- Autosync if booting

if PACKER_BOOTSTRAP then
  Packer.sync()
end

