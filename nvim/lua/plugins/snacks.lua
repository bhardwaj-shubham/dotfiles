return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = {
    bigfile = { enabled = true },
    quickfile = { enabled = true },

    notifier = {
      enabled = true,
      timeout = 3000,
    },
    input = {
      enabled = true,
    },
    picker = {
      enabled = true,
    },
  },
}
