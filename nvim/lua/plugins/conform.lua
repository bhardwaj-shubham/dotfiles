return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },

  opts = {
    -- 🔥 format on save (skip if errors exist)
    format_on_save = function(bufnr)
      if vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR })[1] then
        return
      end
      return { timeout_ms = 2000, lsp_fallback = false } -- ✅ important change
    end,

    -- 🔧 formatters
    formatters_by_ft = {
      lua = { "stylua" },

      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },

      json = { "prettier" },
      yaml = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },

      -- 🐍 Python
      python = { "ruff_format", "ruff_organize_imports" },

      rust = { "rustfmt" },

      sh = { "shfmt" },
    },
  },

  config = function(_, opts)
    require("conform").setup(opts)
  end,
}
