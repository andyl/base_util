-- lsp/settings/cssls

local opts = {
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
    scss = { validate = true,
          lint = {
              unknownAtRules = "ignore"
          }
    },
  },
}

return opts
