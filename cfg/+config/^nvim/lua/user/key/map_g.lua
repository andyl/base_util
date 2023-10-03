-- key/map_g

local n_opts = {
  mode    = "n",  -- NORMAL mode
  prefix  = "g",  -- 'g' key
  buffer  = nil,  -- Give a buffer num for buffer local mapping
  silent  = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait  = true, -- use `nowait` when creating keymaps
}

local n_keymap = {

  -- reference https://sbulav.github.io/vim/neovim-opening-urls/
  -- this is for opening URLs in the browser
  -- to use: in normal mode, put cursor over URL, then type 'gx'
  -- also note: gf jumps to file under cursor
  x = { "<Cmd>call jobstart(['xdg-open', expand('<cfile>')], {'detach': v:true})<CR>",
    "Open URL in browser" },

  p = { ":lua chproj()<cr>", "Goto project directory under cursor" },

  t = { -- Table Mode
    name = "TableMode",
    d = { ":TableModeDisable<cr>", "Disable" },
    e = { ":TableModeEnable<cr>", "Enable" },
    r = { ":TableModeRealign<cr>", "Realign" },
    t = { ":TableModeToggle", "Toggle" },
  },

}

if WhichKeyOk then WhichKey.register(n_keymap, n_opts) end
