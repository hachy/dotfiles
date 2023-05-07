local M = {}

local space = " "

local function diagnostic_status()
  local count = {}
  local levels = {
    error = "ERROR",
    warn = "WARN",
    hint = "HINT",
    info = "INFO",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity[level] }))
  end

  local error = ""
  local warn = ""
  local hint = ""
  local info = ""

  if count.error ~= 0 then
    error = "%#DiagnosticError# " .. count.error .. space
  end
  if count.warn ~= 0 then
    warn = "%#DiagnosticWarn# " .. count.warn .. space
  end
  if count.hint ~= 0 then
    hint = "%#DiagnosticHint# " .. count.hint .. space
  end
  if count.info ~= 0 then
    info = "%#DiagnosticInfo# " .. count.info
  end

  return string.format("%s%s%s%s", error, warn, hint, info) .. "%#Statusline#"
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
    diagnostic_status(),
    "%=",
    "%{fugitive#statusline()}",
    "%{''.(&fenc!=''?&fenc:&enc).''}",
    fileformat(),
    "%3p%% %4l:%2c",
  }
  return table.concat(parts, space)
end

return M
