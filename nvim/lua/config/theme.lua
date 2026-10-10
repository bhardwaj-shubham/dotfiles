local M = {}

local theme_file = vim.fn.stdpath("config") .. "/.theme"

-- 📌 Default theme
M.default = "tokyonight"

-- 📦 Available themes
M.themes = {
  "tokyonight",
  "catppuccin",
  "rose-pine",
  "kanagawa",
  "onedark",
}

-- 💾 Save theme
function M.save(theme)
  local file = io.open(theme_file, "w")
  if file then
    file:write(theme)
    file:close()
  end
end

-- 📂 Load saved theme
function M.load()
  local file = io.open(theme_file, "r")
  if file then
    local theme = file:read("*l")
    file:close()
    return theme
  end
  return M.default
end

-- 🎨 Apply theme safely
function M.apply(theme)
  local ok, setup = pcall(require, "themes." .. theme)

  if ok then
    setup()
  end

  local success = pcall(vim.cmd.colorscheme, theme)

  if success then
    M.save(theme)

    require("config.highlights").apply()

    vim.cmd("redrawstatus")
  else
    vim.notify("Theme not found: " .. theme, vim.log.levels.ERROR)
  end
end
-- 🎛 Theme picker
function M.pick()
  vim.ui.select(M.themes, {
    prompt = "Select Theme:",
  }, function(choice)
    if choice then
      M.apply(choice)
    end
  end)
end

return M
