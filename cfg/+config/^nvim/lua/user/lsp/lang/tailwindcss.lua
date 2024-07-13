-- lsp/lang/tailwindcss

local ok_lsp, lspconfig = pcall(require, "lspconfig")
if not ok_lsp then return end

local function root_pattern(...)
  local patterns = vim.iter({ ... }):flatten():totable()

  return function(startpath)
    for _, pattern in ipairs(patterns) do
      return lspconfig.util.search_ancestors(startpath, function(path)
        local path = vim.fn.glob(lspconfig.util.path.join(path, pattern))
        if lspconfig.util.path.exists(path) then return path end
      end)
    end
  end
end

local opts = {
  init_options = {
    userLanguages = {
      eelixir = "phoenix-heex",
      elixir = "phoenix-heex",
      eruby = "erb",
      heex = "phoenix-heex",
    },
  },
  handlers = {
    ["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
      local var = {_id = params._id}
      vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", var)
      print("tailwindcss getConfiguration callback")
    end,
  },
  settings = {
    dynamicRegistration = true,
    includeLanguages = {elixir = "html-eex", heex = "html-eex", erb = "html-eex"},
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
          'class[:]\\s*"([^"]*)"',
          'class.*"([^"]*)',
          "~H\"\"\".*class=\"([^\"]*)\".*\"\"\"",
        }
      },
      validate = true,
    },
  },
  filetypes = {"ex", "css", "scss", "sass", "html", "heex", "elixir", "eelixir"},
  root_dir = root_pattern(
    "./assets/tailwind.config.js",
    "tailwind.config.js",
    "tailwind.config.ts",
    "postcss.config.js",
    "postcss.config.ts",
    "package.json",
    "node_modules",
    ".git",
    ".pbase"
  ),
}

return opts
