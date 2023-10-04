-- plug/lualine

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then return end

local function proj_root()
  return ProjRoot()
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local mode = {
	"mode",
	fmt = function(str) return str end,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { branch, diagnostics },
		lualine_b = { proj_root },
		lualine_c = { "filename" },
		lualine_x = { },
		lualine_y = { mode },
		lualine_z = { filetype, "encoding" },
	},
	inactive_sections = {
		lualine_a = { branch, diagnostics },
		lualine_b = { "filename" },
		lualine_c = { },
		lualine_x = { },
		lualine_y = { mode },
		lualine_z = { filetype, "encoding" },
	},
	tabline = {},
	extensions = {},
})
