local M = {}
local Indicator = "│ "

local function SIGEnable()
  local shiftwidth = vim.bo.shiftwidth - 1
  -- get the first char
  local indicator = Indicator:match("^.?[\128-\191]*")
  -- get the last char
  local separator = Indicator:match(".?[\128-\191]*$")

  vim.opt_local.list = true
  vim.opt_local.listchars = vim.o.listchars
  vim.opt_local.listchars:remove("leadmultispace")
  vim.opt_local.listchars:append({
    leadmultispace = indicator .. string.rep(separator, shiftwidth),
  })
end

function M.setup(indicator)
  if indicator ~= nil then
    if type(indicator) == "string" then
      Indicator = indicator
    else
      error("setup should receive a string but received a " .. type(indicator))
    end
  end

  local group = vim.api.nvim_create_augroup("simpleIndentGuides", {})

  -- Update when shiftwidth is set
  vim.api.nvim_create_autocmd("OptionSet", {
    pattern = "shiftwidth",
    group = group,
    callback = SIGEnable,
  })

  -- The autocmd above does not work at startup
  -- and when you change to already visible buffers
  vim.api.nvim_create_autocmd("BufWinEnter", {
    group = group,
    callback = SIGEnable,
  })

  -- Toggle
  vim.api.nvim_create_user_command("SIGToggle", function()
    if vim.wo.listchars:match("leadmultispace") then
      vim.opt_local.listchars:remove("leadmultispace")
    else
      SIGEnable()
    end
  end, {})
end

return M
