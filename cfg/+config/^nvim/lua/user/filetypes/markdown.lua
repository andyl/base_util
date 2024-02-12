-- Syntax highlighting modifications for markdown

local function override_markdown_highlights()

  local function set_hl_safe(group, properties)
    local status_ok, _ = pcall(vim.api.nvim_set_hl, 0, group, properties)
    if not status_ok then
      print("Failed to set highlight for group: " .. group)
    end
  end

  -- Example: Set the 'emphasis' and 'strong' highlight to be the same as Normal text
  -- You'll need to identify the correct capture names for underscores if available
  set_hl_safe("Error", { })
  set_hl_safe("markdownError", { })
  set_hl_safe("@text.error", { link = "Normal" })
  set_hl_safe("@text.markdown_error", { link = "Normal" })
  set_hl_safe("@text.emphasis", { link = "Normal" })
  set_hl_safe("@text.strong", { link = "Normal" })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.defer_fn(function()
      vim.api.nvim_set_hl(0, "Error", {})
      override_markdown_highlights()
    end, 100) -- Adjust the delay as needed
  end
})

