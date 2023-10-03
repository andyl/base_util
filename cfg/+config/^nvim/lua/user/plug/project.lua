-- project navigation
--------------------------------------------------------

-- put your cursor over a directory path
-- press 'gp' (go project)
-- test to see if the directory path exists
-- if true
--   - change the CWD
--   - change the Nvim tree root path
-- else
--   - write an error message

function cursor_path()
    local line = vim.fn.getline('.')
    local pattern = '%s*(~?/[%w.-_/]+)%s*'
    local filepath = string.match(line, pattern)

    if filepath then
        return filepath
    else
        return ""
    end
end

function is_directory(path)
    if string.match(path, "^~") then
        path = vim.fn.expand(path)
    end

    local stat = vim.loop.fs_stat(path)

    if stat and stat.type == "directory" then
        return true
    else
        return false
    end
end

function chproj()
  local path = cursor_path()
  if path == "" then
    print("Error: no path under cursor")
  else
    if is_directory(path) then
      print("Changed root path (" .. path .. ")")
      vim.fn.chdir(path)
      require("nvim-tree.api").tree.change_root(path)
    else
      print("Error: not a directory (" .. path .. ")")
    end
  end
end

-- vim.api.nvim_set_keymap('n', '<Leader>gp', ':lua print(get_filepath_under_cursor())<CR>', { noremap = true, silent = true })

