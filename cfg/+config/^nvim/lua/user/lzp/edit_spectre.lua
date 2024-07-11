-- edit_spectre
--
-- https://github.com/nvim-pack/nvim-spectre
-- https://www.lazyvim.org/plugins/editor#nvim-spectre

local opts = {
  "nvim-pack/nvim-spectre",
  build = false,
  cmd = "Spectre",
  dependencies = {
    "folke/trouble.nvim",
  },
  opts = { open_cmd = "noswapfile vnew" },
}

return opts
