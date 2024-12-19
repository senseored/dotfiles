-- local colors = {
--   fg1 = '#282828',
--   color2 = '#504945',
--   fg2 = '#ddc7a1',
--   color3 = '#32302f',
--   color4 = '#a89984',
--   color5 = '#7daea3',
--   color6 = '#a9b665',
--   color7 = '#d8a657',
--   color8 = '#d3869b',
--   color9 = '#ea6962',
-- }
local colors = {
  black = '#282828',
  white = '#ebdbb2',
  red = '#fb4934',
  green = '#b8bb26',
  blue = '#83a598',
  yellow = '#fe8019',
  gray = '#a89984',
  darkgray = '#3c3836',
  lightgray = '#504945',
  inactivegray = '#7c6f64',
}

local gruvbox_mat_inv = {
  normal = {
    a = { fg = colors.gray, bg = colors.black, gui = 'bold' },
    b = { fg = colors.lightgray, bg = colors.white },
    c = { fg = colors.darkgray, bg = colors.gray },
  },
  insert = {
    a = { fg = colors.blue, bg = colors.black, gui = 'bold' },
    b = { fg = colors.lightgray, bg = colors.white },
    c = { fg = colors.lightgray, bg = colors.white },
  },
  visual = {
    a = { fg = colors.yellow, bg = colors.black, gui = 'bold' },
    b = { fg = colors.lightgray, bg = colors.white },
    c = { fg = colors.inactivegray, bg = colors.black },
  },
  replace = {
    a = { fg = colors.red, bg = colors.black, gui = 'bold' },
    b = { fg = colors.lightgray, bg = colors.white },
    c = { fg = colors.black, bg = colors.white },
  },
  command = {
    a = { fg = colors.green, bg = colors.black, gui = 'bold' },
    b = { fg = colors.lightgray, bg = colors.white },
    c = { fg = colors.inactivegray, bg = colors.black },
  },
  inactive = {
    a = { fg = colors.darkgray, bg = colors.gray, gui = 'bold' },
    b = { fg = colors.darkgray, bg = colors.gray },
    c = { fg = colors.darkgray, bg = colors.gray },
  },
  -- normal = {
  --   a = { bg = colors.fg1, fg = colors.color4, gui = 'bold' },
  --   b = { bg = colors.fg2, fg = colors.color2 },
  --   c = { bg = colors.fg2, fg = colors.color3 },
  -- },
  -- command = { a = { bg = colors.fg1, fg = colors.color5, gui = 'bold' } },
  -- inactive = { a = { bg = colors.fg2, fg = colors.color2 } },
  -- insert = { a = { bg = colors.fg1, fg = colors.color6, gui = 'bold' } },
  -- replace = { a = { bg = colors.fg1, fg = colors.color7, gui = 'bold' } },
  -- terminal = { a = { bg = colors.fg1, fg = colors.color8, gui = 'bold' } },
  -- visual = { a = { bg = colors.fg1, fg = colors.color9, gui = 'bold' } },
}
return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'gruvbox_dark',
          -- theme = 'gruvbox-material',
          -- theme = 'gruvbox',
          -- theme = gruvbox_mat_inv,
          background = { style = 'dark' },
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          -- section_separators = { left = '', right = '' },
          -- component_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = false,
          globalstatus = true,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      }
    end,
  },
}
