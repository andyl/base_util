-- noice.nvim

require("noice").setup({})

require("telescope").load_extension("noice")

require("noice").setup({
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "nohl",
      },
      opts = { skip = true },
    },
  },
})
