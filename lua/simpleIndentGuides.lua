---@type table
local M = {}
---@type string
local Guide = "│"
---@type string
local Padding = " "

--- Updates the guides according to shiftwidth
local function SIGUpdate()
  vim.opt_local.listchars = vim.o.listchars
  vim.opt_local.listchars:remove("leadmultispace")
  vim.opt_local.listchars:append({
    leadmultispace = Guide .. string.rep(Padding, (vim.bo.shiftwidth - 1)),
  })
end

---@param guide string|nil
---@param padding string|nil
function M.setup(guide, padding)
  if guide ~= nil then
    Guide = guide
    if padding ~= nil then
      Padding = padding
    end
  end

  local group = vim.api.nvim_create_augroup("simpleIndentGuides", {})

  -- Update when shiftwidth is set
  vim.api.nvim_create_autocmd("OptionSet", {
    pattern = "shiftwidth",
    group = group,
    callback = SIGUpdate,
  })

  -- The autocmd above does not work at startup
  -- and when you change to already visible buffers
  vim.api.nvim_create_autocmd("BufWinEnter", {
    group = group,
    callback = SIGUpdate,
  })
end

return M
