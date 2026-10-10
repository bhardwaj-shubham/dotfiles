return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufReadPost",

  opts = {
    indent = {
      char = "│",
    },

    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
      -- show_current_context = true,
      -- show_current_context_start = false,
    },

    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
      },
    },
  },
}
