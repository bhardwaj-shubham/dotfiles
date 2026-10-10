return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
  },

  opts = {
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,

    filesystem = {
      follow_current_file = {
        enabled = true,
      },

      hijack_netrw_behavior = "open_default",

      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },

    window = {
      position = "left",
      width = 32,

      mappings = {
        ["<space>"] = "none",

        ["l"] = "open",
        ["h"] = "close_node",

        ["<cr>"] = "open",

        ["a"] = "add",
        ["A"] = "add_directory",

        ["d"] = "delete",
        ["r"] = "rename",

        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",

        ["R"] = "refresh",

        ["?"] = "show_help",
      },
    },

    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
      },

      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "󰜌",
      },

      modified = {
        symbol = "●",
      },

      git_status = {
        symbols = {
          added = "✚",
          modified = "",
          deleted = "✖",
          renamed = "󰁕",
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
      },
    },
  },

  config = function(_, opts)
    require("neo-tree").setup(opts)

    -- Transparency
    local groups = {
      "NeoTreeNormal",
      "NeoTreeNormalNC",
      "NeoTreeEndOfBuffer",
      "NeoTreeFloatBorder",
      "NeoTreeWinSeparator",
      "NeoTreeCursorLine",
    }

    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end
  end,
}
