-- packer_boot - auto-install packer on new system

-- cmds - :PackerInstall | :PackerClean | :PackerSync | :PackerUpdate

local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing Packer - close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

