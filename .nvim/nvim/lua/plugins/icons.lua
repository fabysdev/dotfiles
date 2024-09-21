return {
  'DaikyXendo/nvim-material-icon',
  lazy = false,
  config = function()
    require('nvim-web-devicons').setup {
      override = {},
      color_icons = true,
      default = true,
    }
  end,
}
