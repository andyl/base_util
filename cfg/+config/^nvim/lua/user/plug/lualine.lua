-- plug/lualine

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then return end

-- local hide_in_width = function()
-- 	return vim.fn.winwidth(0) > 80
-- end

-- local location = {
-- 	"location",
-- 	padding = 0,
-- }

-- cool function for progress
-- local progress = function()
-- 	local current_line = vim.fn.line(".")
-- 	local total_lines = vim.fn.line("$")
-- 	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
-- 	local line_ratio = current_line / total_lines
-- 	local index = math.ceil(line_ratio * #chars)
-- 	return chars[index]
-- end

-- local spaces = function()
-- 	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end

-- local diff = {
-- 	"diff",
-- 	colored = false,
-- 	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
--   cond = hide_in_width
-- }

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
		lualine_b = { "filename" },
		lualine_c = { },
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
