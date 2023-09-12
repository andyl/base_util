# Neovim Configuration README

## Plugins / Packer 

The plugin manager is Packer - 'wbthomason/packer.nvim'

| Command              | Desc                                            |
|----------------------|-------------------------------------------------|
| :PackerSync          | Perform `PackerUpdate` and then `PackerCompile` |
| :PackerCompile       | Regenerate compiled loader file                 |
| :PackerUpdate        | Clean, then update and install plugins          |
| :PackerClean         | Remove any disabled or unused plugins           |
| :PackerInstall       | Clean, then install missing plugins             |
| :PackerLoad <plugin> | Loads <plugin> immediately                      |

## Plugins / Lazy.nvim 

| Command              | Desc                                            |
|----------------------|-------------------------------------------------|
| :Lazy                | Show the UI for the Lazy Package Manager        |

## Language Servers

The language server manager is Mason - jwilliamboman/mason.nvim

| Command | Desc                            |
|---------|---------------------------------|
| :Mason  | Show installed language servers |

## Treesitter Grammars

| Command   | Desc                       |
|-----------|----------------------------|
| :TSUpdate | Update Treesitter Grammars |

