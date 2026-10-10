return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",

  opts = {
    preset = "modern",

    transparent_bg = true,

    options = {
      show_source = {
        enabled = true,
      },
    },
  },
}
