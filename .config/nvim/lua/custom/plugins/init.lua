return {
  -- {
  --   'neoclide/coc.nvim',
  --   lazy = false,
  -- },
  { 'iamcco/markdown-preview.nvim' },
  { 'dhruvasagar/vim-table-mode' },
  { 'nvim-neotest/nvim-nio' },
  { 'mbbill/undotree' },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
  {
    'hiphish/rainbow-delimiters.nvim',
    config = function()
      require('rainbow-delimiters.setup').setup {
        -- strategy = {
        --   [''] = rainbow_delimiters.strategy['global'],
        --   vim = rainbow_delimiters.strategy['local'],
        -- },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        priority = {
          [''] = 110,
          lua = 210,
        },
        highlight = {
          'RainbowRed',
          'RainbowYellow',
          'RainbowBlue',
          'RainbowOrange',
          'RainbowGreen',
          'RainbowViolet',
          'RainbowCyan',
        },
      }
    end,
  },
}
