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
    'echasnovski/mini.test',
    version = '*',
    config = function()
      require('mini.test').setup({
        -- Options for collection of test cases. See `:h MiniTest.collect()`.
        collect = {
          -- Temporarily emulate functions from 'busted' testing framework
          -- (`describe`, `it`, `before_each`, `after_each`, and more)
          emulate_busted = true,

          -- Function returning array of file paths to be collected.
          -- Default: all Lua files in 'tests' directory starting with 'test_'.
          find_files = function()
            return vim.fn.globpath('tests', '**/test_*.lua', true, true)
          end,

          -- Predicate function indicating if test case should be executed
          filter_cases = function(case) return true end,
        },

        -- Options for execution of test cases. See `:h MiniTest.execute()`.
        execute = {
          -- Table with callable fields `start()`, `update()`, and `finish()`
          reporter = nil,

          -- Whether to stop execution after first error
          stop_on_error = false,
        },

        -- Path (relative to current directory) to script which handles project
        -- specific test running
        script_path = 'scripts/minitest.lua',

        -- Whether to disable showing non-error feedback
        silent = false,
      })
    end
  },

  {
    'echasnovski/mini.nvim',
    version = '*', -- stable branch (for 'main' branch, use 'false')
    depends_on = {
      'echasnovski/mini.icons',
      'echasnovski/mini.test',
    },
  }
}
