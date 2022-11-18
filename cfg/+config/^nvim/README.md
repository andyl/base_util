# Neovim Configuration README

## Plugins 

The plugin manager is Packer - 'wbthomason/packer.nvim'

| Command              | Desc                                            |
|----------------------|-------------------------------------------------|
| :PackerCompile       | Regenerate compiled loader file                 |
| :PackerClean         | Remove any disabled or unused plugins           |
| :PackerInstall       | Clean, then install missing plugins             |
| :PackerUpdate        | Clean, then update and install plugins          |
| :PackerSync          | Perform `PackerUpdate` and then `PackerCompile` |
| :PackerLoad <plugin> | Loads <plugin> immediately                      |

## Language Servers

The language server manager is Mason - jwilliamboman/mason.nvim

| Command | Desc                            |
|---------|---------------------------------|
| :Mason  | Show installed language servers |

## Treesitter Grammars

| Command   | Desc                       |
|-----------|----------------------------|
| :TSUpdate | Update Treesitter Grammars |

