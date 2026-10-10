return {
  "dnlhc/glance.nvim",

  cmd = "Glance",

  opts = {
    height = 18,
    zindex = 45,

    preserve_win_context = true,

    detached = false,

    preview_win_opts = {
      cursorline = true,
      number = true,
      wrap = true,
    },

    border = {
      enable = true,
      top_char = "―",
      bottom_char = "―",
    },

    list = {
      position = "right",
      width = 0.33,
    },

    theme = {
      enable = true,
      mode = "auto",
    },

    folds = {
      fold_closed = "",
      fold_open = "",
      folded = true,
    },

    indent_lines = {
      enable = true,
      icon = "│",
    },

    winbar = {
      enable = true,
    },
  },
}
