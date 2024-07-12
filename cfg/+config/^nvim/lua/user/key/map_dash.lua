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
  ["1"] = { ":tabnext1<cr>",                            "Goto Tab 1"              },
  ["2"] = { ":tabnext2<cr>",                            "Goto Tab 2"              },
  ["3"] = { ":tabnext3<cr>",                            "Goto Tab 3"              },
  ["4"] = { ":tabnext4<cr>",                            "Goto Tab 4"              },
  ["5"] = { ":tabnext5<cr>",                            "Goto Tab 5"              },
  ["6"] = { ":tabnext6<cr>",                            "Goto Tab 6"              },
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

