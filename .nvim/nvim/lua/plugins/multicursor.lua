return {
  'smoka7/multicursors.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvimtools/hydra.nvim',
  },
  opts = {},
  cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
  keys = {
    {
      mode = { 'v', 'n' },
      '<Leader>m',
      '<cmd>MCstart<cr>',
      desc = 'Create a selection for selected text or word under the cursor',
    },
    {
      mode = { 'v', 'n' },
      '<Leader>mv',
      '<cmd>MCvisual<cr>',
      desc = 'Select the last visual mode selection and start listening for the actions',
    },
    {
      mode = { 'v', 'n' },
      '<Leader>mp',
      '<cmd>MCpattern<cr>',
      desc = 'Select the last visual mode selection and start listening for the actions',
    },
  },
}
