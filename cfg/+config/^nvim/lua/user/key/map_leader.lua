-- key/map_leader

local n_opts = {
  mode    = "n",        -- NORMAL mode
  prefix  = "<leader>", -- leader key ","
  buffer  = nil,        -- Specify a buffer num for buffer local mapping
  silent  = true,       -- use `silent` when creating keymaps
  noremap = true,       -- use `noremap` when creating keymaps
  nowait  = true,       -- use `nowait` when creating keymaps
}

local keytable = {

  ["q"] = { ":q<cr>",                       "Pane Quit"            },
  ["e"] = { "<cmd>NvimTreeToggle<cr>",      "Explorer"             },
  ["s"] = { ":sp<cr>",                      "Pane Split"           },
  ["v"] = { ":vsp<cr>",                     "Pane Vsplit"          },
  ["o"] = { ":only<cr>",                    "Pane Only"            },
  ["O"] = { ":only<cr>:NvimTreeToggle<cr>", "Pane Only w/Explorer" },

  a = { -- vim_projecionist - navigation between SRC and TEST files
    name = "Alternate File",
    e = { ":A<cr>",  "Open in Term"   },
    v = { ":AV<cr>", "Open in Vsplit" },
    s = { ":AS<cr>", "Open in Split"  },
    t = { ":AT<cr>", "Open in Tab"    },
  },

  f = { -- telescope - fuzzy finders
    name = "Find",
    b = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = true})<cr>",    "Buffers" },
    f = { "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = true})<cr>", "Files"   },
    m = { "<cmd>lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown{previewer = true})<cr>",    "MRU"     },
    t = { "<cmd>Telescope live_grep theme=ivy<cr>",                                                                            "Text"    },
  },

  t = { -- tab manipulation and navigation
    name = "Tab",
    n = { ":tabnew<cr>",                      "New"                             },
    o = { ":tabnew %<cr>",                    "Open pane in New Tab"            },
    O = { ":tabnew %<cr>:NvimTreeToggle<cr>", "Open pane in New Tab w/Explorer" },
    x = { ":tabclose<cr>",                    "Close"                           },
    h = { ":tabp<cr>",                        "Jump Left"                       },
    l = { ":tabn<cr>",                        "Jump Right"                      },
  },

}

if WhichKeyOk then WhichKey.register(keytable, n_opts) end

-- TAB NAVIGATION
KmN("<leader>t1", "1gt")
KmN("<leader>t2", "2gt")
KmN("<leader>t3", "3gt")
KmN("<leader>t4", "4gt")
KmN("<leader>t5", "5gt")
KmN("<leader>t6", "6gt")
KmN("<leader>t7", "7gt")
KmN("<leader>t8", "8gt")
KmN("<leader>t9", "9gt")

-- PANE LAYOUT
KmN("<leader>ls", "<C-w>J") -- layout split
KmN("<leader>lv", "<C-w>L") -- layout vertical
KmN("<leader>lr", "<C-w>r") -- layout rotate

-- CROSS-FILE - copy across vim instances using external file
KmN("<leader>xy", "y:call writefile(split(@0,\"\\n\"), \"/tmp/vimtmp\")<cr>")
KmV("<leader>xy", "y:call writefile(split(@0,\"\\n\"), \"/tmp/vimtmp\")<cr>")
KmN("<leader>xd", "d:call writefile(split(@1,\"\\n\"), \"/tmp/vimtmp\")<cr>")
KmV("<leader>xd", "d:call writefile(split(@1,\"\\n\"), \"/tmp/vimtmp\")<cr>")
KmN("<leader>xp", ":r /tmp/vimtmp<cr>")

