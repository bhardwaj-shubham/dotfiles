return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "saghen/blink.cmp",
  },

  config = function()
    local blink = require("blink.cmp")

    local capabilities = blink.get_lsp_capabilities()

    -- Lua
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim", "Snacks" } },
        },
      },
    })
    vim.lsp.enable("lua_ls")

    -- TypeScript / JavaScript (NO duplicate diagnostics)
    vim.lsp.config("ts_ls", {
      capabilities = capabilities,

      -- 🔥 disable tsserver diagnostics (use ESLint instead)
      handlers = {
        ["textDocument/publishDiagnostics"] = function() end,
      },
    })
    vim.lsp.enable("ts_ls")

    -- Python
    vim.lsp.config("pyright", {
      capabilities = capabilities,

      handlers = {
        ["textDocument/publishDiagnostics"] = function() end,
      },
    })
    vim.lsp.enable("pyright")
  end,
}
