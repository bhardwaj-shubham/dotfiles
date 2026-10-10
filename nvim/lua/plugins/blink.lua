return {
  "saghen/blink.cmp",
  event = "InsertEnter", -- ⚡ lazy load only when needed

  dependencies = {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },

  version = "1.*",

  opts = {
    fuzzy = {
      implementation = "lua", -- Later for fast, you can change it to 'rust'
    },
    appearance = {
      nerd_font_variant = "mono",
    },

    keymap = {
      preset = "default",

      ["<CR>"] = { "accept", "fallback" }, -- better than <NL>
      ["<C-space>"] = { "show", "fallback" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },

      ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
    },

    completion = {
      menu = {
        border = "rounded",
      },
      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
        },
      },
    },

    snippets = {
      preset = "luasnip",
    },

    sources = {
      default = { "lsp", "snippets", "buffer", "path" },

      providers = {
        lsp = { score_offset = 100 },
        snippets = { score_offset = 90 },
        buffer = { score_offset = 80 },
        path = {
          score_offset = 70,
          opts = {
            show_hidden_files_by_default = true,
          },
        },
      },
    },
  },

  config = function(_, opts)
    require("blink.cmp").setup(opts)

    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
