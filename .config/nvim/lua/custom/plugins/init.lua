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
        -- theme = 'hyper',
        -- config = {
        --   week_header = {
        --     enable,
        --   },
        -- },
        theme = 'hyper',
        config = {
          week_header = { enable = true },
          footer = {}, --your footer
        },
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
  -- {
  --   'mrcjkb/rustaceanvim',
  --   version = '^5', -- Recommended
  --   lazy = false, -- This plugin is already lazy
  -- },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    ft = 'rust',
    config = function()
      local mason_registry = require 'mason-registry'
      local codelldb = mason_registry.get_package 'codelldb'
      local extension_path = codelldb:get_install_path() .. '/extension/'
      local codelldb_path = extension_path .. 'adapter/codelldb'
      -- -- local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
      -- -- If you are on Linux, replace the line above with the line below:
      local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
      local cfg = require 'rustaceanvim.config'

      vim.g.rustaceanvim = {
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
        server = {
          on_attach = cfg.on_attach,
        },
      }
    end,
  },
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap, dapui = require 'dap', require 'dapui'
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      require('dapui').setup()
    end,
  },

  {
    'saecki/crates.nvim',
    ft = { 'toml' },
    config = function()
      require('crates').setup {
        completion = {
          cmp = {
            enabled = true,
          },
        },
      }
      require('cmp').setup.buffer {
        sources = { { name = 'crates' } },
      }
    end,
  },
}
