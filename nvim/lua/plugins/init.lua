return {
  -- Core editing features
  require("plugins.blink"), -- Autocomplete
  require("plugins.autopairs"), -- Auto-closing brackets/quotes

  -- LSP and tooling
  require("plugins.mason"), -- Mason for managing LSP servers
  require("plugins.lsp"), -- LSP configuration
  require("plugins.glance"), -- Glance lsp definitions
  require("plugins.treesitter"), -- Syntax highlighting
  require("plugins.telescope"), -- Fuzzy finder
  require("plugins.conform"), -- Formatting
  require("plugins.lint"), -- Linting
  require("plugins.todo-comments"), -- TODO comments
  require("plugins.tiny-diagnostic"), -- Tiny inline diagnostic
  require("plugins.markview"), -- MarkDown Viewer

  -- Project navigation and Git
  require("plugins.neotree"), -- File explorer / sidebar
  require("plugins.gitsigns"), -- Git signs in gutter
  require("plugins.lazygit"), -- Terminal Git UI

  -- UI and status
  require("plugins.bufferline"), -- Buffer tabs on top
  require("plugins.buremove"), -- Buffer closing
  require("plugins.lualine"), -- Statusline
  require("plugins.colorscheme"), -- Colorscheme applied last
  require("plugins.indent-blankline"), -- Show indent line
  require("plugins.snacks"), -- snacks
  require("plugins.which-key"), -- which-key
}
