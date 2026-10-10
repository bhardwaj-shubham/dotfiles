return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  opts = {
    options = {
      mode = "buffers",
      numbers = "none",
      close_command = function(bufnr)
        require("mini.bufremove").delete(bufnr, false)
      end,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      separator_style = "thin",
      persist_buffer_sort = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      move_mouse_event = true,
      always_show_bufferline = true,
      indicator = {
        style = "underline",
      },
      buffer_close_icon = " 󰅖 ",
      modified_icon = " ● ",
      close_icon = "  ",
      left_trunc_marker = " ",
      right_trunc_marker = " ",
      max_name_length = 30,
      tab_size = 18,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Explorer",
          highlight = "Directory",
          separator = true,
        },
      },
    },
    highlights = {
      buffer_selected = {
        bold = false,
        italic = true,
      },
    },
  },
}
