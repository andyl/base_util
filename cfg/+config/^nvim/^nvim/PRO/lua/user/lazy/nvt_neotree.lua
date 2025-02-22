-- nvt_neotree
--
-- Neotree is a file-explorer.  Toggle open with "<leader>e"
--
-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- https://www.lazyvim.org/plugins/editor#neo-treenvim
-- https://github.com/s1n7ax/nvim-window-picker
-- :help neo-tree
-- :Telescope help_tags [neo-tree]

local opts = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",       -- utility functions
    "nvim-tree/nvim-web-devicons", -- icon fonts
    "MunifTanjim/nui.nvim",        -- ui component library
    {
      "s1n7ax/nvim-window-picker", -- window picker
      config = function()
        require('window-picker').setup({
          hint = 'floating-big-letter',
        })
      end,
    },
  },
  deactivate = function()
    vim.cmd([[Neotree close]])
  end,
  opts = {
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
    window = {
      mappings = {
        ["o"] = "open_with_window_picker",
        ["v"] = "vsplit_with_window_picker",
        ["s"] = "split_with_window_picker",
        ["t"] = "open_tabnew",
        ["h"] = "close_node",
        ["oc"] = "noop",
        ["od"] = "noop",
        ["og"] = "noop",
        ["om"] = "noop",
        ["on"] = "noop",
        ["os"] = "noop",
        ["ot"] = "noop",
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          desc = "Copy Path to Clipboard",
        },
        ["O"] = {
          function(state)
            require("lazy.util").open(state.tree:get_node().path, { system = true })
          end,
          desc = "Open with System Application",
        },
        ["P"] = { "toggle_preview", config = { use_float = false } },
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if "noop" and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      git_status = {
        symbols = {
          unstaged = "★",
          staged   = "󰱒",
        },
      },
    },
  },
  config = function(_, opts)
    local function on_move(_) -- data
      -- LazyVim.lsp.on_rename(data.source, data.destination)
    end

    local events = require("neo-tree.events")
    opts.event_handlers = opts.event_handlers or {}
    vim.list_extend(opts.event_handlers, {
      { event = events.FILE_MOVED,   handler = on_move },
      { event = events.FILE_RENAMED, handler = on_move },
    })
    require("neo-tree").setup(opts)
  end,
}

return opts
