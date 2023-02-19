-- autolist.nvim

print('autolist')

require('autolist').setup({
  enabled = true,
  ft = {
    "markdown",
    "text",
  }
})

-- require('autolist').setup()

