return {
  'numToStr/Comment.nvim',
  opts = {},
  config = function()
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<C-_>', require('Comment.api').toggle.linewise.current, opts)
    vim.keymap.set('n', '<C-7>', require('Comment.api').toggle.linewise.current, opts)
    vim.keymap.set('v', '<C-_>', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
    vim.keymap.set('v', '<C-7>', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
  end,
}
