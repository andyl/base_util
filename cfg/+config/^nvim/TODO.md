# Nvim Config

## Plugins

- Nav: NvimTree, Telescope, Which Key
- Code: Completion, LSP, Treesitter 

## CrossLang

|------------|-------------------|----------------|
|            | vim tgt           | lua tgt        |
|------------|-------------------|----------------|
| vim caller | source <filename> | lua cmd        |
| lua caller | vim.cmd           | require "path" |
|------------|-------------------|----------------|

## WhichKey

Filenames: 

| Key     | File             |
|---------|------------------|
| NA      | map-base         |
| ,       | map-leader       |
| z       | map-z            |
| g       | map-g            |
| \       | map-slash        |
| [       | map-bracketopen  |
| ]       | map-bracketclose |
| <C-x>   | map-mod-c-x      |
| <A-x>   | map-mod-a-x      |
| <A-X>   | map-mod-a-X      |
| <C-A-X> | map-mod-a-x      |

Note: C- and C-A- only take lower case letters
Note: A- takes upper or lower case letters

Organization: 

| Group              | Prefix | Examples        |
|--------------------|--------|-----------------|
| LSP goto           | \g     | \gv \gs \ge \gt |
| File print         | <C-p>  | <C-p>p <C-p>l   |
| Table mode         | <C-t>  | <C-t>m <C-t>r   |
| Terminals          | \t     | \tv \ts \tt     |
| Tabs               | ,t     | ,tn ,tx         |
| Tmpfile Copy/Paste | \t     | ,tn ,tx         |
| Layout             | ,l     | ,lr ,ls ,lv     |
| Alt file nav       | \a     | \av \at \as     |

## 2022 Jan 28 Fri

- [x] Find file 
- [x] Find mru file 
- [x] Load frecency telescope extension
- [x] Update find keymap (ff=find-file, fm=find-mru)
- [x] F4 to clear highlights
- [x] Make marks appear in gutter
- [x] Auto-Remove eol whitespace upon save
- [x] Autoinstall lsp servers 
- [x] Table Mode
- [x] Current filename always on tab bar
- [x] WhichKey - Configure for Slash Commands '\'
- [x] NvimTree - Don't close editor if NvimTree is last window open
- [x] NvimTree - Launch file in split 

## 2022 Jan 29 Sat

- [x] WhichKey - Split config: "conf" and "spec"
- [x] WhichKey - Move Keymaps to WhichKey
- [x] ToggleTerm - 50% open on vsplit
- [x] ToggleTerm - Resize from within terminal

## 2022 Jan 30 Sun

- [x] Create `.bashrc_nvim`
- [x] Found Packer Bug (plugin directory)

## 2022 Jan 30 Sun

- [x] Packer popup window is broken
- [x] DEV: Fix Packer popup window problem
- [x] next/prev warning
- [x] next/prev bug 
- [x] LSP Elixir - disable Dialyxer
- [x] Get alt file navigation working 
- [x] LSP working goto source 
- [x] WhichKey - <leader>q is broken -> change to <leader>c
- [x] DEV: Move 100% Packer config to lua scripts 
- [x] Re-install telescope/frecency
- [x] Telescope: open hotkeys (o/open, v/vsplit, s/split, t/tab)
- [x] NvimTree - Launch file in new tab
- [x] NvimTree - Open OverWrites first window
- [x] NvimTree - Directory search 
- [x] Understand quickfix lists and local lists

## 2022 Jan 31 Mon

- [x] Syntax Highlighting - Ruby
- [x] Syntax Highlighting - Bash
- [x] Syntax Highlighting - Elixir
- [x] <C-k> (pane-up) is broken (lsp conflict?)
- [x] Commenting is broken (gc, gcc)
- [x] NvimTree - Toggle git symbols
- [x] Lualine - file name in footer

## 2022 Feb 01 Tue

- [x] Add mapping for ac (EasyAlign)
- [x] PRO: Migrate to Packer 
- [x] PRO: Migrate to WhichKey
- [x] PRO: Migrate to LSP & CMP
- [x] PRO: Migrate to Treesitter
- [x] PRO: Move 100% vimscript to lua
- [x] PRO: Migrate to Telescope
- [x] PRO: Migrate to NvimTree
- [x] Lualine - edit status in footer
- [x] Snippets - Write snippets 
- [x] Install Luapad - a repl-like Lua explorer

## 2022 Feb 02 Wed

- [x] NvimTree - Rename & Delete with Open Buffers
- [x] Fix key mapping bugs
- [x] Add keymap for snippet jumps

## Tasks

- [ ] Read NvimTree source 
- [ ] Read Neovim Source 

- [ ] Telescope - working MRU lookup 

- [ ] NvimTree - Highlight active file (BROKEN)
- [ ] NvimTree - One-Char Copy Command 

- [ ] LSP: Cleanup elixirls config (dialyzer = false)
- [ ] LSP: Fix or remove nlsp-settings

- [ ] WhichKey - Add KeyMap nav/search
- [ ] WhichKey - Define hotkeys for quickfix and local lists

- [ ] Lualine - file path in footer

