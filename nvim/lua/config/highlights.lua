local M = {}

function M.apply()
  local groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",

    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "NeoTreeEndOfBuffer",
    "NeoTreeFloatBorder",

    "BufferLineFill",

    "SignColumn",
    "FoldColumn",
  }

  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE" })
  end
end

return M
