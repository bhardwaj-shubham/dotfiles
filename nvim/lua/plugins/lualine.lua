-- lua/plugins/lualine.lua

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = function()
    local icons = {
      diagnostics = { error = " ", warn = " ", info = " " },
      git = { branch = "" },
    }

    return {
      options = {
        theme = "auto",
        globalstatus = true,
        component_separators = {
          left = "│",
          right = "│",
        },

        section_separators = {
          left = "",
          right = "",
        },
        disabled_filetypes = { statusline = { "alpha", "dashboard" } },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = {
          { "branch", icon = icons.git.branch },
          {
            "diff",
            symbols = {
              added = "+",
              modified = "~",
              removed = "-",
            },
          },
          { "diagnostics", symbols = icons.diagnostics },
        },
        lualine_c = {},
        lualine_x = {

          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    }
  end,
}
