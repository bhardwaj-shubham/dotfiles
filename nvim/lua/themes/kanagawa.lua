return function()
  require("kanagawa").setup({
    theme = "dragon", -- wave, lotus, dragon
    background = { -- map the value of 'background' option to a theme
      dark = "dragon",
      light = "lotus",
    },

    -- compile = true,
    transparent = true,
    undercurl = true, -- enable undercurls

    commentStyle = { italic = true },
    functionStyle = { bold = false, italic = false },
    keywordStyle = { bold = true, italic = false },
  })
end
