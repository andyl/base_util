-- key/map_dash

local n_opts = {
  mode    = "n",     -- NORMAL mode
  prefix  = "-",    -- dash key
  buffer  = nil,     -- Give a buffer num for buffer local mapping
  silent  = true,    -- use `silent` when creating keymaps
  noremap = true,    -- use `noremap` when creating keymaps
  nowait  = true,    -- use `nowait` when creating keymaps
}

local n_keymap = {
  ["r"] = { "<cmd>lua require('spectre').toggle()<cr>", "Replace across Projects" },
}

if WhichKeyOk then WhichKey.register(n_keymap, n_opts) end

local v_opts = {
  mode    = "v",     -- VISUAL mode
  prefix  = "-",     -- dash key
  buffer  = nil,     -- Give a buffer num for buffer local mapping
  silent  = true,    -- use `silent` when creating keymaps
  noremap = true,    -- use `noremap` when creating keymaps
  nowait  = true,    -- use `nowait` when creating keymaps
}

local v_keymap = {
  }


if WhichKeyOk then WhichKey.register(v_keymap, v_opts) end

