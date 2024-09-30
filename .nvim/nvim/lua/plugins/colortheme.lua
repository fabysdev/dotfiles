return {
  'projekt0n/github-nvim-theme',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.cmd 'colorscheme github_dark_dimmed'

    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#1E232A', fg = '#1E232A' })
    vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = '#F69D4E' })

    vim.api.nvim_set_hl(0, 'NeoTreeGitModified', { fg = '#F69D4E' })
    vim.api.nvim_set_hl(0, 'NeoTreeGitAdded', { fg = '#E2C08D' })
    vim.api.nvim_set_hl(0, 'NeoTreeGitDeleted', { fg = '#A0423E' })
    vim.api.nvim_set_hl(0, 'NeoTreeGitRenamed', { fg = '#2BD04D' })
    vim.api.nvim_set_hl(0, 'NeoTreeGitUntracked', { fg = '#2BD04D' })
    vim.api.nvim_set_hl(0, 'NeoTreeGitUnstaged', { fg = '#F69D4E' })
  end,
}
