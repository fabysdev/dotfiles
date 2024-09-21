return {
  'goolord/alpha-nvim',
  dependencies = {
    'DaikyXendo/nvim-material-icon',
  },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.startify'

    dashboard.section.header.val = {
      [[ _  _  ___   ___  __   __ ___  __  __ ]],
      [[| \| || __| / _ \ \ \ / /|_ _||  \/  |]],
      [[| .  || _| | (_) | \   /  | | | |\/| |]],
      [[|_|\_||___| \___/   \_/  |___||_|  |_|]],
      [[                                      ]],
    }

    alpha.setup(dashboard.opts)
  end,
}
