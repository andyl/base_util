-- noice.nvim

-- require("telescope").load_extension("noice")

local function skip_notifications_with(term)
  return {filter = { event = "notify", find = term }, opts = { skip = true }}
end

require("noice").setup({
  routes = {
    skip_notifications_with("cannot close the last tab"),
    skip_notifications_with("written"),
  }
})
