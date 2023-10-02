-- project
--------------------------------------------------------

-- see https://github.com/ahmedkhalf/project.nvim

local status_proj, project = pcall(require, "project_nvim")
if not status_proj then return end

project.setup()

-----

-- local status_tree, tree = pcall(require, "nvim-tree")
-- if not status_tree then return end
--
-- tree.setup({
--   sync_root_with_cwd = true,
--   respect_buf_cwd = true,
--   update_focused_file = {
--     enable = true,
--     update_root = true
--   },
-- })

-----

require('telescope').load_extension('projects')
