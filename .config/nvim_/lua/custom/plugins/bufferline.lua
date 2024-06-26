return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = false,
    opts = {
      options = {
        separator_style = 'slope',
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match 'error' and ' ' or ' '
          return ' ' .. icon .. count
        end,
      },
    },
  },
}
