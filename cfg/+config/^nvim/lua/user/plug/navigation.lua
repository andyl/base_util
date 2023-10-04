-- project navigation functions
--------------------------------------------------------

-- see ../key/map_g.lua for keyboard commands ...

local function clean_path(inputString)
  local bad_chars = "()[]<>{}"
    local result = ""
    for i = 1, #inputString do
        local char = inputString:sub(i, i) -- Extract a single character
        if not bad_chars:find(char, 1, true) then
            result = result .. char -- Add the character to the result if it's not in the set to remove
        end
    end
    return result
end

local function full_path(path)
  return vim.fn.expand(path)
end

local function home_path(path)
  local comp = full_path(path)
  local home = full_path('$HOME')
  local fini = string.gsub(comp, home, "~")
  return fini
end

-- return the path under the cursor
local function cursor_path()
  vim.cmd([[normal! yiW]])
  local filepath = vim.fn.getreg('')
  local corepath = clean_path(filepath)

  if filepath then
    return corepath
  else
    return ""
  end
end

-- predicate returns true if path is a directory
local function is_dir(path)
  if string.match(path, "^~") then
    path = full_path(path)
  end

  local stat = vim.loop.fs_stat(path)

  if stat and stat.type == "directory" then
    return true
  else
    return false
  end
end

local function is_file(path)
  if string.match(path, "^~") then
    path = full_path(path)
  end

  local stat = vim.loop.fs_stat(path)

  if stat and stat.type == "file" then
    return true
  else
    return false
  end
end

local function get_path(input_path)
  if is_file(input_path) then
    return vim.fn.fnamemodify(input_path, ':p')
  else
    return input_path
  end
end

local function project_root(input_path)
  local matches = { '.git', '.pbase' }
  local home_dir = full_path('$HOME')
  local path = get_path(input_path)

  while path ~= home_dir do
    for _, match in ipairs(matches) do
      local target_path = path .. '/' .. match
      if vim.fn.isdirectory(target_path) == 1 or vim.fn.filereadable(target_path) == 1 then
        if match == ".pbase" then
          local file = io.open(target_path, "r")
          if file then
            local newpath = file:read()
            file:close()
            return newpath
          else
            return {}
          end
        else
          return path
        end
      end
    end
    path = vim.fn.fnamemodify(path, ':h')
  end
  return home_dir
end

local function opentree()
  vim.cmd("NvimTreeOpen")
end

local history_file = full_path("~/.local/share/nvim/projhist.txt")

local function clear_history_line(lineToRemove)
  local filename = history_file
  local lines = {}
  local found = false
  local expath = full_path(lineToRemove)

  local file = io.open(filename, "r")

  if not file then
    return
  end

  for line in file:lines() do
    if line ~= expath then
      table.insert(lines, line)
    else
      found = true
    end
  end

  file:close()

  if found then
    file = io.open(filename, "w")

    if not file then
      return
    end

    for _, line in ipairs(lines) do
      file:write(line .. "\n")
    end

    file:close()
  end
end

local function write_history(path)
  clear_history_line(path)
  local hfile = io.open(history_file, "a")
  if hfile then
    hfile:write(full_path(path) .. "\n")
    hfile:close()
  end
end

local function setwd(path)
  print("New project root (" .. path .. ")")
  vim.fn.chdir(path)
  require("nvim-tree.api").tree.change_root(path)
  write_history(path)
  opentree()
end

local function open_file(filepath, mode)
  local opts = {
    ["f"] = function()
      vim.cmd(":e " .. filepath)
    end,
    ["e"] = function()
      vim.cmd(":e " .. filepath)
    end,
    ["v"] = function()
      vim.cmd(":vsplit " .. filepath)
    end,
    ["s"] = function()
      vim.cmd(":split " .. filepath)
    end,
    ["t"] = function()
      vim.cmd(":tabnew " .. filepath)
    end,
    ["F"] = function()
      vim.cmd(":e " .. filepath)
      setwd(project_root(filepath))
    end,
    ["E"] = function()
      vim.cmd(":e " .. filepath)
      setwd(project_root(filepath))
    end,
    ["V"] = function()
      vim.cmd(":vsplit " .. filepath)
      setwd(project_root(filepath))
    end,
    ["S"] = function()
      vim.cmd(":split " .. filepath)
      setwd(project_root(filepath))
    end,
    ["T"] = function()
      vim.cmd(":tabnew " .. filepath)
      setwd(project_root(filepath))
    end,
  }
  opts[mode]()
end

local function current_buffer_path()
  local current_buf = vim.fn.bufnr("%")
  if current_buf ~= 0 then
    -- return full_path(vim.fn.bufname(current_buf))
    return vim.fn.expand('%:p')
  else
    return ""
  end
end

function OpenCursorPath(mode)
  local path = cursor_path()
  if path == "" then
    print("Error: no filepath under cursor")
  else
    if is_file(path) then
      open_file(path, mode)
      print("")
    else
      print("Error: not a filepath (" .. path .. ")")
    end
  end
end

function ProjRoot()
  local path = current_buffer_path()
  if path == "" then
    return "---"
  else
    return home_path(project_root(current_buffer_path()))
  end
end

function SetwdBufferPath()
  local proj_path = home_path(project_root(current_buffer_path()))
  setwd(proj_path)
end

function SetwdCursorPath()
  local path = cursor_path()
  if path == "" then
    print("Error: no path under cursor")
  else
    if is_dir(path) then
      setwd(path)
    else
      local proj_path = project_root(path)
      setwd(proj_path)
    end
  end
end

----- TELESCOPE

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function read_lines_to_table()
  local lines = {}
  local file = io.open(history_file, "r")
  if file then
    for line in file:lines() do
      table.insert(lines, 1, line)
    end
    file:close()
    return lines
  else
    return {}
  end
end

function ShowProjectPicker()
  local opts = read_lines_to_table()

  pickers.new(opts, {
    finder = finders.new_table({ results = opts }),
    attach_mappings = function(bufnr, _)
      actions.select_default:replace(function()
        actions.close(bufnr)
        local proj_path = action_state.get_selected_entry()
        setwd(proj_path[1])
      end)
      return true
    end
  }):find()
end
