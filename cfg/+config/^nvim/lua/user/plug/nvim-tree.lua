-- nvim-tree
--------------------------------------------------------

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then return end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then return end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  renderer = {
    highlight_opened_files = "all",
    icons = {
      glyphs = { folder = { arrow_closed = "›" } },
      show = {
        git = false,
        file = true,
        folder = true,
        folder_arrow = true,
        -- tree_width = 30
      }
    }
  },
  ignore_ft_on_setup = { "startify", "dashboard", "alpha", },
  -- update_to_buf_dir  = { enable = true, auto_open = true },
  system_open        = { cmd = nil, args = {} },
  filters            = { dotfiles = false, custom = {} },
  -- git_hl = 1,
  -- quit_on_open  = 0,
  -- add_trailing  = 1,
  disable_netrw = true,
  hijack_netrw  = true,
  open_on_setup = false,
  -- auto_close    = false,
  open_on_tab   = false,
  hijack_cursor = false,
  update_cwd    = true,
  -- disable_window_picker = 0,
  -- root_folder_modifier = ":t",
  -- highlight_opened_files = 3,
  diagnostics = {
    enable = true,
    icons = {
      hint    = "",
      info    = "",
      warning = "",
      error   = "",
    },
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {},
  },
  git = {
    enable = false,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    -- auto_resize = true,
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h",     cb = tree_cb "close_node" },
        { key = "<C-s>", cb = tree_cb "split"      },
        { key = "s",     cb = tree_cb "split"      },
        { key = "v",     cb = tree_cb "vsplit"     },
        { key = "t",     cb = tree_cb "tabnew"     },
      },
    },
    number = false,
    relativenumber = false,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  -- show_icons = {
  --   git = 0,
  --   folders = 1,
  --   files = 1,
  --   folder_arrows = 1,
  --   tree_width = 30,
  -- },
}

