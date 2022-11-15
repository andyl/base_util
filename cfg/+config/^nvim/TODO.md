# Nvim Todo 

## Reading 
- [ ] Read Lsp Help + Source + Luapad
- [ ] Read Telescope Help + Source + Luapad 
- [ ] Read NvimTree Help + Source + Luapad 

## LSP
- [ ] LSP: Cleanup elixirls config (dialyzer = false)
- [ ] LSP: Fix tailwindlsp in phoenix project using Mitch Hanberg hints 

## Goals 
- [ ] lsp and umbrella projects 
- [ ] goal: goto-definition, completion, documentation from HEEX 
- [ ] goal: goto-definition, completion, documentation from ~H 
- [ ] goal: approach n how to incorporate refactoring actions 

## Glitches 
- [ ] CSS linting warning on `@tailwind` directive
- [ ] tailwind autocomplete on HEEX files is broken 
- [ ] tailwind autocomplete working with Emmet 

## Study 
- [ ] How to navigate on select lists?
- [ ] Learn quicklists and local lists 
- [ ] Write credo plugins 

## NvimTree
- [ ] NvimTree - Highlight active file (BROKEN)
- [ ] NvimTree - One-Char Copy Command 

## WhichKey 
- [ ] WhichKey - Define hotkeys for quickfix and local lists
- [ ] WhichKey - Open quickfix item in vsplit, tab, etc.

## Lualine 
- [ ] Lualine - file path in footer

## Mitch Hanberg Tailwind LSP config 

https://github.com/mhanberg/.dotfiles/blob/7f2ef94229299c0968041defdd75a4557b37c128/config/nvim/init.lua#L348-L370

```lua 
LSP.setup(
  "tailwindcss",
  vim.tbl_deep_extend("force", default_tw_config, {
    init_options = {
      userLanguages = {
        elixir = "phoenix-heex",
        eruby = "erb",
        heex = "phoenix-heex",
      },
    },
    settings = {
      tailwindCSS = {
        experimental = {
          classRegex = {
            [[class: "([^"]*)]],
          },
        },
      },
    },
    filetypes = { "elixir", "eelixir", "html", "liquid", "heex" },
  })
)
```

## Next Steps 
