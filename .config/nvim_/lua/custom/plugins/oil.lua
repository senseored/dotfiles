return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    opts = {
      default_file_explorer = true,
      columns = {
        'icon',
        'permissions',
        'size',
      },
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 4,
        win_options = {
          winblend = 1,
        },
      },
    },
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
}
