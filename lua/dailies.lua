local M = {}

M.setup = function()
  vim.api.nvim_create_user_command("Dailies", M.run, {})
end

M.run = function()
  local file = io.popen("dailies")
  -- This will read all of the output, as always
  local output = file:read('*all')
  file:close()
  local output = output:sub(2, -3)

  vim.schedule(function()
    vim.cmd("edit " .. vim.fn.fnameescape(output))
  end)
end

return M
