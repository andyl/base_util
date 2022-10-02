-- key/map_slash

local n_opts = {
  mode    = "n",     -- NORMAL mode
  prefix  = "\\",    -- slash key
  buffer  = nil,     -- Give a buffer num for buffer local mapping
  silent  = true,    -- use `silent` when creating keymaps
  noremap = true,    -- use `noremap` when creating keymaps
  nowait  = true,    -- use `nowait` when creating keymaps
}

local n_keymap = {

  a = { -- LSP operations
    name = "LSP",
    n = { ":lua vim.diagnostic.goto_next()<cr>",  "GotoNext Diagnostic"      },
    p = { ":lua vim.diagnostic.goto_prev()<cr>",  "GotoPrev Diagnostic"      },
    l = { ":lua vim.diagnostic.open_float()<cr>", "Current Line Diagnostics" },
    d = { "<cmd>Telescope diagnostics<CR>",       "Telescope Diagnostics"    },
    u = { ":lua vim.lsp.buf.references()<cr>",    "Show Users"               },
    k = { ":lua vim.lsp.buf.hover()<cr>",         "Doc Hover"                },
    c = { ":lua vim.lsp.buf.code_action()<cr>",   "Code Action"              },
    r = { ":lua vim.lsp.buf.rename()<cr>",        "Rename"                   },
    f = { ":lua vim.lsp.buf.formatting()<cr>",    "Reformat"                 },
  },

  g = { -- LSP Goto Definition
    name = "GoTo Definition",
    e = { ":lua vim.lsp.buf.definition()<cr>"               , "Current Pane" },
    s = { ":split  | lua vim.lsp.buf.definition()<cr>"      , "Split"        },
    v = { ":vsplit | lua vim.lsp.buf.definition()<cr>"      , "Vsplit"       },
    t = { ":vsplit | lua vim.lsp.buf.definition()<cr><C-W>T", "Tab"          },
  },

  t = { -- Terminal Management
    name = "Terminal",
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float"  },
    s = { ":split  | terminal<cr>A"            , "Split"  },
    v = { ":vsplit | terminal<cr>A"            , "Vsplit" },
    t = { ":vsplit | terminal<cr><C-W>T"       , "Tab"    },
  },

  i = { -- Insert
    name = "Insert",
    d = { ":r !w_date_tag<cr>kJA",   "Date"              },
    t = { ":r !w_time_exact<cr>kJA", "Exact Time"        },
    q = { ":r !w_time_qhour<cr>kJA", "Quarter-hour Time" },
  },


}

if WhichKeyOk then WhichKey.register(n_keymap, n_opts) end

local i_opts = {
  mode    = "i",     -- INSERT mode
  prefix  = "\\",    -- slash key
  buffer  = nil,     -- Give a buffer num for buffer local mapping
  silent  = true,    -- use `silent` when creating keymaps
  noremap = true,    -- use `noremap` when creating keymaps
  nowait  = true,    -- use `nowait` when creating keymaps
}


local i_keymap = {

  i = { -- Insert
    name = "Insert",
    d = { "<esc>:r !w_date_tag<cr>kJA",   "Date"              },
    t = { "<esc>:r !w_time_exact<cr>kJA", "Exact Time"        },
    q = { "<esc>:r !w_time_qhour<cr>kJA", "Quarter-hour Time" },
  },

}


if WhichKeyOk then WhichKey.register(i_keymap, i_opts) end

local v_opts = {
  mode    = "v",     -- VISUAL mode
  prefix  = "\\",    -- slash key
  buffer  = nil,     -- Give a buffer num for buffer local mapping
  silent  = true,    -- use `silent` when creating keymaps
  noremap = true,    -- use `noremap` when creating keymaps
  nowait  = true,    -- use `nowait` when creating keymaps
}


local v_keymap = {

  s = { -- Sort
    name = "Sort",
    a = { -- Ascending
      name = "Ascending",
      ["1"] = {":!sort -k1<CR>", "Column 1"},
      ["2"] = {":!sort -k2<CR>", "Column 2"},
      ["3"] = {":!sort -k3<CR>", "Column 3"},
      ["4"] = {":!sort -k4<CR>", "Column 4"},
      ["5"] = {":!sort -k5<CR>", "Column 5"},
      ["6"] = {":!sort -k6<CR>", "Column 6"},
      ["7"] = {":!sort -k7<CR>", "Column 7"},
      ["8"] = {":!sort -k8<CR>", "Column 8"},
      ["9"] = {":!sort -k9<CR>", "Column 9"},
    },
    d = { -- Descending
      name = "Descending",
      ["1"] = {":!sort -rk1<CR>", "Column 1"},
      ["2"] = {":!sort -rk2<CR>", "Column 2"},
      ["3"] = {":!sort -rk3<CR>", "Column 3"},
      ["4"] = {":!sort -rk4<CR>", "Column 4"},
      ["5"] = {":!sort -rk5<CR>", "Column 5"},
      ["6"] = {":!sort -rk6<CR>", "Column 6"},
      ["7"] = {":!sort -rk7<CR>", "Column 7"},
      ["8"] = {":!sort -rk8<CR>", "Column 8"},
      ["9"] = {":!sort -rk9<CR>", "Column 9"},
    },
  },

}

if WhichKeyOk then WhichKey.register(v_keymap, v_opts) end

