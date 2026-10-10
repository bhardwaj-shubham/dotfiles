return {
  { "folke/tokyonight.nvim", lazy = true },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "rose-pine/neovim", lazy = true },
  { "navarasu/onedark.nvim", lazy = true },

  {
    "LazyVim/LazyVim",
    lazy = false,
    priority = 1000,
    config = function()
      local theme = require("config.theme").load()
      require("config.theme").apply(theme)
    end,
  },
}
