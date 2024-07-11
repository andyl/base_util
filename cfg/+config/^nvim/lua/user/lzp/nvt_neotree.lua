-- nvt_neotree
--
-- https://github.com/nvim-neo-tree/neo-tree.nvim

local opts = {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",       -- utility functions
      "nvim-tree/nvim-web-devicons", -- icon fonts
      "MunifTanjim/nui.nvim",        -- ui component library
      "3rd/image.nvim",              -- image support in preview window: See `# Preview Mode` for more information
    }
}

return opts

