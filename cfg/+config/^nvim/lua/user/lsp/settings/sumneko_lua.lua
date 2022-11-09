-- lsp/settings/sumneko_lua

local opts = {
	settings = {

		Lua = {
			diagnostics = {
				globals = { "vim", "use" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}

return opts
