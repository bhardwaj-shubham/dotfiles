return function()
  require("tokyonight").setup({
    style = "moon", -- storm|moon|night|day
    transparent = true,

    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },

    plugins = {
      auto = true,
    },
  })
end
