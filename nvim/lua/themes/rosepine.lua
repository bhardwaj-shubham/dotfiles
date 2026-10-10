return function()
  require("rose-pine").setup({
    variant = "moon", -- main|moon|dawn
    dark_variant = "moon", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,
    styles = {
      bold = true,
      italic = true,
      transparency = true,
    },
  })
end
