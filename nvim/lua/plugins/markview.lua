return {
  "OXY2DEV/markview.nvim",
  lazy = false,

  config = function()
    require("markview").setup({
      preview = {
        enable = true,

        -- Render Markdown in normal mode.
        modes = { "n", "no", "c" },

        -- Don't use hybrid mode as the default editing experience.
        hybrid_modes = {},

        -- Better wrapping for Markdown.
        linewise_hybrid_mode = false,
      },

      markdown = {
        headings = {
          org_indent = true,
          org_indent_wrap = true,
        },

        list_items = {
          wrap = true,
        },

        block_quotes = {
          wrap = true,
        },
      },
    })
  end,
}
