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
    n = { ":lua vim.diagnostic.goto_next()<cr>", "GotoNext Diagnostic"  },
    p = { ":lua vim.diagnostic.goto_prev()<cr>", "GotoPrev Diagnostic"  },
    d = { "<cmd>Telescope diagnostics<CR>"     , "Telescope Diagnostics"},
    u = { ":lua vim.lsp.buf.references()<cr>"  , "Show Users"           },
    k = { ":lua vim.lsp.buf.hover()<cr>"       , "Doc Hover"            },
    c = { ":lua vim.lsp.buf.code_action()<cr>" , "Code Action"          },
    r = { ":lua vim.lsp.buf.rename()<cr>"      , "Rename"               },
    f = { ":lua vim.lsp.buf.formatting()<cr>"  , "Reformat"             },
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
    d = { ":r !w_date_tag<cr>kJA" , "Date"        },
    t = { ":r !w_time_tag<cr>kJA" , "Exact Time"  },
    q = { ":r !w_timestamp<cr>kJA", "Quarter-hour Time"  },
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
    d = { "<esc>:r !w_date_tag<cr>kJA", "Date"  },
    t = { "<esc>:r !w_time_tag<cr>kJA", "Time"  },
  },

}

if WhichKeyOk then WhichKey.register(i_keymap, i_opts) end

