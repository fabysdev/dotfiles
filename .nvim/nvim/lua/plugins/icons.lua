return {
  'DaikyXendo/nvim-material-icon',
  config = function()
    require('nvim-web-devicons').setup {
      override = {},
      color_icons = true,
      default = true,
    }
  end,
}
