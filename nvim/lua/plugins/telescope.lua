return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",

  dependencies = {
    "nvim-lua/plenary.nvim",

    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },

    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },

  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
    { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
    { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Word" },

    {
      "<leader>/",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          -- winblend = 10,
          previewer = false,
        }))
      end,
      desc = "Search in buffer",
    },
  },

  opts = function()
    local actions = require("telescope.actions")

    return {
      defaults = {
        -- 🔥 Better ripgrep (live_grep)
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob",
          "!.git/*",
          "--glob",
          "!node_modules/*",
          "--glob",
          "!dist/*",
          "--glob",
          "!build/*",
        },

        -- minimal ignore (fd handles rest)
        file_ignore_patterns = {
          ".git/",
        },

        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<CR>"] = actions.select_default,
          },
        },
      },

      pickers = {
        find_files = {
          hidden = true,

          -- ⚡ use fd (FAST)
          find_command = {
            "fd",
            "--type",
            "f",
            "--hidden",
            "--exclude",
            ".git",
            "--exclude",
            "node_modules",
            "--exclude",
            "dist",
            "--exclude",
            "build",
          },
        },

        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end,
        },
      },

      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },

      borderchars = {
        "─",
        "│",
        "─",
        "│",
        "╭",
        "╮",
        "╯",
        "╰",
      },
    }
  end,

  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)

    -- 🛡 safe extension loading
    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "ui-select")
  end,
}
