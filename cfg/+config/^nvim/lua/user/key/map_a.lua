-- key/map_a

-- at = align table
-- usage: vipat
-- ac = align character
-- usage: vipac

vim.cmd ":nmap at :EasyAlign *\\|<cr>"
vim.cmd ":nmap ac <Plug>(EasyAlign)"
vim.cmd ":vmap ac <Plug>(EasyAlign)"

