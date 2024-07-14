-- key_mini
--
-- Utility modules for which_key
--
-- https://github.com/echasnovski/mini.nvim

return {
  {
    'echasnovski/mini.icons',
    version = false,
    config = function()
      require('mini.icons').setup()
    end
  },
  {
    'echasnovski/mini.nvim',
    version = false,
    depends_on = {
      'echasnovski/mini.icons',
    },
  }
}

