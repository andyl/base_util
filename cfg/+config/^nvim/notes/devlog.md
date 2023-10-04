# Neovim Devlog 

## Next Actions  

PROJECTS

## 2023 Jul 10 Mon 

actions
- enabled dkarter/bullets.vim 
- commented out gaoDean/autolist.nvim 

learnings 
- toggle checkboxes with <leader>x 
- nested checkboxes are supported 
- indent with '>' in normal mode 
- toggle action works with nested checkboxes (with bugs)

customizations 
- vimcmd.lua 
- let g:bullets_checkbox_markers = ' .-ox'

## 2023 Jul 14 Fri 

Obsidian Org Tools 
- folders 
- links 
- tags 
- metadata 

Links now work properly in nvim and obsidian 
- marksman lsp 
- add ~/.config/marksman/config.toml 

## 2023 Sep 11 Mon

Convert from Packer.nvim to Lazy.nvim 
- Packer is no longer maintained
- Lazy is the recommended alternative

## 2023 Oct 03 Tue

TableMode 
- enable: `gte` 
- disable: `gtd` 
- realign: `gtr` 

Project & File Navigation 

- Navigate between projects and files based on paths in the document text.
- Useful to transition between Obsidian notes (~/util/org) and code repos. 

| Code    | ~/.config/nvim/lua/user/plug/navigation.lua |
| Keymaps | ~/.config/nvim/lua/user/key/map_g.lua       |

- Project nav (`gpp`) 
- Set project from buffer (`gpb`)
- Project history editing (`gph`)
- Telescope Navigate between project (find projects - `fp`)

- Open file (in split, fsplit, etc.) 
- Open file and set WD

