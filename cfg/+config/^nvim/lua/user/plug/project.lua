-- telescope-project
--------------------------------------------------------

-- see https://github.com/nvim-telescope/telescope-project.nvim

-- local status_proj, project = pcall(require, "project_nvim")
-- if not status_proj then return end
--
-- project.setup()

-----

require('telescope').load_extension('project')

local project_actions = require("telescope._extensions.project.actions")

require('telescope').setup {
  extensions = {
    project = {
      base_dirs = {
        '~/dev/src',
        {'~/dev/src2'},
        {'~/dev/src3', max_depth = 4},
        {path = '~/dev/src4'},
        {path = '~/dev/src5', max_depth = 2},
      },
      hidden_files = true, -- default: false
      theme = "dropdown",
      order_by = "asc",
      search_by = "title",
      sync_with_nvim_tree = true,
      on_project_selected = function(prompt_bufnr)
        project_actions.change_working_directory(prompt_bufnr, true)
      end
    }
  }
}
