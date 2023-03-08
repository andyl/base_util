-- lsp/settings/tailwindcss

local opts = {
  init_options = {
    userLanguages = {
      eelixir = "phoenix-heex",
      elixir = "phoenix-heex",
      eruby = "erb",
      heex = "phoenix-heex",
    },
  },
  -- handlers = {
  --   ["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
  --     lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", { _id = params._id })
  --     P("tailwindcss getConfiguration callback")
  --   end,
  -- },
  settings = {
    includeLanguages = {
          ["html-eex"] = "html",
          ["phoenix-heex"] = "html",
      elixir = "html",
      heex = "html",
      erb = "html",
    },
    tailwindCSS = {
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning",
      },
      experimental = {
        classRegex = {
          [[class= "([^"]*)]],
          [[class: "([^"]*)]],
          "~H\"\"\".*class=\"([^\"]*)\".*\"\"\"",
        },
      },
      validate = true,
    },
  },
  filetypes = {
    "css",
    "scss",
    "sass",
    "html",
    "heex",
    "elixir",
    "eelixir",
  },
  -- root_dir = root_pattern(
  --   "./assets/tailwind.config.js",
  --   "tailwind.config.js",
  --   "tailwind.config.ts",
  --   "postcss.config.js",
  --   "postcss.config.ts",
  --   "package.json",
  --   "node_modules",
  --   ".git"
  -- ),
}

return opts
