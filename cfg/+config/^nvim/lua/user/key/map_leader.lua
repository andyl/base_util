-- key/map_leader

local n_opts = {
  mode    = "n",        -- NORMAL mode
  prefix  = "<leader>", -- leader key ","
  buffer  = nil,        -- Specify a buffer num for buffer local mapping
  silent  = true,       -- use `silent` when creating keymaps
  noremap = true,       -- use `noremap` when creating keymaps
  nowait  = true,       -- use `nowait` when creating keymaps
}

local v_opts = {
  mode    = "v",        -- VISUAL mode
  prefix  = "<leader>", -- leader key ","
  buffer  = nil,        -- Specify a buffer num for buffer local mapping
  silent  = true,       -- use `silent` when creating keymaps
  noremap = true,       -- use `noremap` when creating keymaps
  nowait  = true,       -- use `nowait` when creating keymaps
}

local keytable_n = {

  ["q"] = { ":q<cr>",                       "Pane Quit"            },
  ["e"] = { "<cmd>NvimTreeToggle<cr>",      "Explorer"             },
  ["s"] = { ":sp<cr>",                      "Pane Split"           },
  ["v"] = { ":vsp<cr>",                     "Pane Vsplit"          },
  ["o"] = { ":only<cr>",                    "Pane Only"            },
  ["O"] = { ":only<cr>:NvimTreeToggle<cr>", "Pane Only w/Explorer" },

  a = { -- ALT-FILE - vim_projecionist - navigation between SRC and TEST files
    name = "Alternate File",
    e = { ":A<cr>",  "Open in Term"   },
    v = { ":AV<cr>", "Open in Vsplit" },
    s = { ":AS<cr>", "Open in Split"  },
    t = { ":AT<cr>", "Open in Tab"    },
  },

  f = { -- FIND - telescope - fuzzy finders
    name = "Find",
    b = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Buffers"  },
    f = { "<cmd>Telescope find_files<cr>",                                                                                  "Files"    },
    m = { "<cmd>Telescope oldfiles<cr>",                                                                                    "MRU"      },
    c = { "<cmd>Telescope commands<cr>",                                                                                    "Commands" },
    k = { "<cmd>Telescope keymaps<cr>",                                                                                     "Keymaps"  },
    h = { "<cmd>Telescope help_tags<cr>",                                                                                   "Help Tags"},
    t = { "<cmd>Telescope live_grep theme=ivy<cr>",                                                                         "Text"     },
  },

  l = { -- LAYOUT - pane layout
    name = "Layout",
    s = { "<C-w>J", "layout split"    },
    v = { "<C-w>L", "layout vertical" },
    r = { "<C-w>r", "layout rotate"   },
    e = { "<C-w>=", "layout equalize" },
    w = { ":silent !kill -s SIGWINCH $PPID<cr>", "window change" },
  },

  m = { -- MARKDOWN - markdown preview
    name = "Markdown",
    p = { ":MarkdownPreview<CR>"    , "preview start"    },
    x = { ":MarkdownPreviewStop<CR>", "preview stop"     },
  },

  p = { -- PRINT - print files
    name = "Print",
    p = { ":! a2ps -c --highlight-level=none --sides=duplex -T 2 --line-numbers=1 %<cr>",                                       "Portrait"         },
    l = { ":! a2ps -c --highlight-level=none --sides=duplex -T 2 --line-numbers=1 --portrait  --columns=1 --font-size=9 %<cr>", "Landscape"        },
    s = { ":! a2ps -c --highlight-level=none --sides=duplex -T 2 --line-numbers=1 --landscape --columns=1 --font-size=9 %<cr>", "Single Landscape" },
  },

  t = { -- TAB - tab manipulation and navigation
    name = "Tab",
    n = { ":tabnew<cr>",                      "New"                             },
    o = { ":tabnew %<cr>",                    "Open pane in New Tab"            },
    O = { ":tabnew %<cr>:NvimTreeToggle<cr>", "Open pane in New Tab w/Explorer" },
    x = { ":tabclose<cr>",                    "Close"                           },
    h = { ":tabp<cr>",                        "Jump Left"                       },
    l = { ":tabn<cr>",                        "Jump Right"                      },
  },

  x = { -- CROSS-COPY - copy across vim instances using external file
    name = "CrossCopy",
    y = { "y:call writefile(split(@0,\"\\n\"), \"/tmp/vimtmp\")<cr>", "yank"   },
    d = { "d:call writefile(split(@1,\"\\n\"), \"/tmp/vimtmp\")<cr>", "delete" },
    p = { ":r /tmp/vimtmp<cr>",                                       "paste"  },
  }
}

local keytable_v = {
  x = { -- CROSS-COPY - copy across vim instances using external file
    name = "CrossCopy",
    y = { "y:call writefile(split(@0,\"\\n\"), \"/tmp/vimtmp\")<cr>", "yank"   },
    d = { "d:call writefile(split(@1,\"\\n\"), \"/tmp/vimtmp\")<cr>", "delete" },
  }
}

if WhichKeyOk then WhichKey.register(keytable_n, n_opts) end
if WhichKeyOk then WhichKey.register(keytable_v, v_opts) end

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

