return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  dependencies = {
    { "echasnovski/mini.icons", opts = {} },
  },

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 200
  end,

  opts = {
    preset = "modern",

    win = {
      border = "rounded",
      padding = { 1, 2 },
    },

    layout = {
      spacing = 4,
    },

    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },
  },

  config = function(_, opts)
    local wk = require("which-key")

    wk.setup(opts)

    wk.add({
      { "<leader>b", group = "Buffer", icon = "󰈔" },
      { "<leader>c", group = "Code", icon = "󰅩" },
      { "<leader>e", group = "Explorer", icon = "" },
      { "<leader>f", group = "File", icon = "󰈔" },
      { "<leader>g", group = "Git", icon = "󰊢" },
      { "<leader>l", group = "LSP", icon = "󰒋" },
      { "<leader>n", group = "Notifications", icon = "󰂚" },
      { "<leader>p", group = "Plugins", icon = "󰏖" },
      { "<leader>q", group = "Quit", icon = "󰗼" },
      { "<leader>s", group = "Search", icon = "󰍉" },
      { "<leader>u", group = "UI", icon = "󰙵" },
      { "<leader>w", group = "Window", icon = "" },
      { "<leader>x", group = "Diagnostics", icon = "󰒡" },
      { "<leader><tab>", group = "Tabs", icon = "󰓩" },
    })
  end,
}
