local M = {}

local space = " "

local function gitsigns()
  ---@diagnostic disable: undefined-field
  local head = ""
  local status = ""

  if vim.b.gitsigns_head then
    head = " " .. vim.b.gitsigns_head .. space
  end

  local added = ""
  local changed = ""
  local removed = ""

  local bg = vim.fn.synIDattr(vim.fn.hlID "Statusline", "bg")
  vim.api.nvim_set_hl(0, "GitStatusAdd", { default = true, fg = "#9cda7c", bg = bg })
  vim.api.nvim_set_hl(0, "GitStatusChange", { default = true, fg = "#e39e74", bg = bg })
  vim.api.nvim_set_hl(0, "GitStatusDelete", { default = true, fg = "#db6088", bg = bg })

  local d = vim.b.gitsigns_status_dict
  if d then
    if d.added ~= nil then
      added = "%#GitStatusAdd# " .. d.added .. space
    end
    if d.changed ~= nil then
      changed = "%#GitStatusChange# " .. d.changed .. space
    end
    if d.removed ~= nil then
      removed = "%#GitStatusDelete# " .. d.removed
    end
    status = added .. changed .. removed
  end
  return head .. status .. "%#Statusline#"
end

local function fileformat()
  local symbols = {
    unix = "",
    dos = "",
    mac = "",
  }
  return symbols[vim.bo.fileformat] or "%{&ff}"
end

function M.setup()
  local parts = {
    "%<%F %y%m%r",
    vim.diagnostic.status(),
    "%=",
    gitsigns(),
    "%{''.(&fenc!=''?&fenc:&enc).''}",
    fileformat(),
    "%3p%% %4l:%2c",
  }
  return table.concat(parts, space)
end

return M
