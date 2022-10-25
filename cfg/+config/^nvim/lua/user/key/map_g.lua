-- key/map_g

-- reference
-- https://sbulav.github.io/vim/neovim-opening-urls/

-- this is for opening URLs in the browser
-- to use: in normal mode, put cursor over URL, then type 'gx'
-- also note: gf jumps to file under cursor

vim.cmd ":nmap gx <Cmd>call jobstart(['xdg-open', expand('<cfile>')], {'detach': v:true})<CR>"

