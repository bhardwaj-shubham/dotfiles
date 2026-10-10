return {
  "mason-org/mason.nvim",

  event = "VeryLazy", -- ✅ FIXED

  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  opts = {
    ui = {
      border = "rounded",
      width = 0.7,
      height = 0.8,
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },

  config = function(_, opts)
    require("mason").setup(opts)

    require("mason-lspconfig").setup({
      ensure_installed = {
        "html",
        "cssls",
        "lua_ls",
        "pyright",
        "jsonls",
        "yamlls",
        "bashls",
        "marksman",
        "eslint",
        "tailwindcss",
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua",
        "prettier",
        "shfmt",
        "eslint_d",
        "ruff",
      },
      run_on_start = true,
      start_delay = 3000,
    })
  end,
}
