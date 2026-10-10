return function()
  require("catppuccin").setup({
    flavour = "mocha", -- mocha|frappe|macchiato|latte

    transparent_background = true,

    integrations = {
      cmp = true,
      gitsigns = true,
      treesitter = true,
      telescope = true,
      mason = true,
      lsp_trouble = true,
      which_key = true,
      noice = true,
      snacks = true,
      native_lsp = {
        enabled = true,
      },
    },
  })
end
