-- snacks.nvim
-- Simple startup dashboard shown when no files are passed on the command line.
-- This module only handles the dashboard UI and does not configure any other
-- editor behavior.
local M = {}

-- default options
M.opts = {
  recent_files = 5,
}

-- Setup function
function M.setup(opts)
  M.opts = vim.tbl_deep_extend('force', M.opts, opts or {})
  vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
      if vim.fn.argc() == 0 then
        vim.schedule(M.open)
      end
    end,
  })
end

local header = {
  '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
  '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
  '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
  '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
  '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
  '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
}

local entries = {
  {icon = '🔍', label = 'Find File', action = function() vim.cmd('Telescope find_files') end},
  {icon = '📝', label = 'New File', action = function() vim.cmd('ene | startinsert') end},
  {icon = '🔍', label = 'Find Text', action = function() vim.cmd('Telescope live_grep') end},
  {icon = '🗒', label = 'Recent Files', action = function() vim.cmd('Telescope oldfiles') end},
  {icon = '🛠', label = 'Config', action = function() vim.cmd('edit $MYVIMRC') end},
  {icon = '󰒲', label = 'Lazy', action = function() vim.cmd('Lazy') end},
  {icon = '', label = 'Quit', action = function() vim.cmd('qa') end},
}

local function get_recent_files(count)
  local files = {}
  local home = vim.env.HOME
  local n = 0
  for _, file in ipairs(vim.v.oldfiles) do
    if vim.fn.filereadable(file) == 1 then
      n = n + 1
      file = file:gsub('^' .. home, '~')
      table.insert(files, file)
      if n >= count then break end
    end
  end
  return files
end

local function footer()
  local stats = require('lazy').stats()
  return string.format('⚡ Neovim loaded %d/%d plugins in %.2fms', stats.loaded, stats.count, stats.startuptime)
end

function M.open()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.bo[buf].buftype = 'nofile'
  vim.bo[buf].bufhidden = 'wipe'
  vim.bo[buf].swapfile = false
  vim.bo[buf].modifiable = false
  vim.bo[buf].filetype = 'snacks'

  local lines = {}
  vim.list_extend(lines, header)
  table.insert(lines, '')
  for _, item in ipairs(entries) do
    table.insert(lines, string.format('  %s  %s', item.icon, item.label))
  end
  table.insert(lines, '')
  table.insert(lines, 'Recent Files:')
  for _, file in ipairs(get_recent_files(M.opts.recent_files)) do
    table.insert(lines, '  ' .. file)
  end
  table.insert(lines, '')
  table.insert(lines, footer())

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  vim.api.nvim_set_current_buf(buf)
  local ns = vim.api.nvim_create_namespace('snacks')
  for i = 0, #header-1 do
    vim.api.nvim_buf_add_highlight(buf, ns, 'Title', i, 0, -1)
  end
  local menu_start = #header + 1
  local current = 1
  local function redraw()
    for i = 1, #entries do
      vim.api.nvim_buf_clear_namespace(buf, ns, menu_start + i - 1, menu_start + i)
      local hl = (i == current) and 'Visual' or 'Normal'
      vim.api.nvim_buf_add_highlight(buf, ns, hl, menu_start + i - 1, 0, -1)
    end
  end
  redraw()

  local function move(delta)
    current = math.max(1, math.min(#entries, current + delta))
    redraw()
  end

  vim.keymap.set('n', 'j', function() move(1) end, {buffer = buf, nowait = true})
  vim.keymap.set('n', 'k', function() move(-1) end, {buffer = buf, nowait = true})
  vim.keymap.set('n', '<Down>', function() move(1) end, {buffer = buf, nowait = true})
  vim.keymap.set('n', '<Up>', function() move(-1) end, {buffer = buf, nowait = true})
  vim.keymap.set('n', '<CR>', function()
    vim.api.nvim_buf_delete(buf, {force = true})
    entries[current].action()
  end, {buffer = buf, nowait = true})
  vim.keymap.set('n', 'q', function() vim.api.nvim_buf_delete(buf, {force = true}) end, {buffer = buf, nowait = true})
end

return M

