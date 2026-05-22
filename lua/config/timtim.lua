local M = {}
local timer = nil
local seconds = 0
local running = false
local win, buf

local function update_display()
  local h = math.floor(seconds / 3600)
  local m = math.floor((seconds % 3600) / 60)
  local s = seconds % 60
  local txt = string.format("%02d:%02d:%02d", h, m, s)
  if buf and vim.api.nvim_buf_is_valid(buf) then
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { txt })
  end
end

function M.open()
  if win and vim.api.nvim_win_is_valid(win) then
    print("error" .. win)
    return
  end
  buf = vim.api.nvim_create_buf(false, true)
  local w, h = 10, 1
  win = vim.api.nvim_open_win(buf, false, {
    relative = "editor",
    width = w,
    height = h,
    col = vim.o.columns - w - 1,
    row = 0,
    style = "minimal",
    border = "single",
  })
  update_display()
end

function M.close()
  vim.api.nvim_buf_delete(buf, {})
  buf = nil
  win = nil
end

function M.start()
  if not (win and vim.api.nvim_win_is_valid(win)) then
    M.open()
  end
  if running then return end
  running = true
  timer = (vim.uv or vim.loop).new_timer()
  timer:start(0, 1000, vim.schedule_wrap(function()
    seconds = seconds + 1
    update_display()
  end))
end

function M.stop()
  if timer then timer:stop() end
  running = false
end

function M.toggle()
  if running then
    M.stop()
  else
    M.start()
  end
end

function M.reset()
  if seconds == 0 then
    M.close()
    return
  end
  M.stop()
  seconds = 0
  update_display()
end

return M
