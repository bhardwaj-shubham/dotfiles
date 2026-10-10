return function()
  require("onedark").setup({
    style = "cool", -- "dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = true, -- Show/hide background
    code_style = {
      comments = "italic",
      keywords = "italic",
      functions = "none",
      strings = "none",
      variables = "none",
    },

    -- Lualine options --
    lualine = {
      transparent = true, -- lualine center bar transparency
    },
  })
end
