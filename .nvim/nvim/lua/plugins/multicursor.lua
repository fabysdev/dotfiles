return {
  'mg979/vim-visual-multi',
  config = function()
    vim.g.VM_maps = {
      ['Find Next'] = '<A-s>',
      ['Goto Prev'] = '{',
      ['Goto Next'] = '}',
      ['Dot'] = '#',
    }
  end,
}
