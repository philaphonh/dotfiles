local lsp_opts = require('user.settings.lsp_options')
local map_opts = require('user.settings.mapping_options')

-- vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>Lspsaga show_line_diagnostics<CR>', map_opts)
-- vim.api.nvim_set_keymap('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', map_opts)
-- vim.api.nvim_set_keymap('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', map_opts)

vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', map_opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', map_opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', map_opts)


-- List of language servers
local servers = {
  'ts_ls',
  'vue_ls',
  'svelte',
  'astro',
  'tailwindcss',
  'gopls',
  'rust_analyzer',
  'pyright',
  'lua_ls',
  'jsonls',
  'yamlls',
  'dockerls'
}

-- Setup each language servers
for _, lsp in pairs(servers) do
  local server_opts = {
    capabilities = lsp_opts.capabilities,
    on_attach = lsp_opts.on_attach,
  }

  -- Lua LSP
  -- Primarily use for Neovim config
  if (lsp == 'lua_ls') then
    server_opts.on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if
            path ~= vim.fn.stdpath('config')
            and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. './luarc.jsonc'))
        then
          return
        end
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT',
          path = {
            'lua/?.lua',
            'lua/?/init.lua'
          }
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME
          }
        }
      })
    end

    server_opts.settings = {
      Lua = {
        -- runtime = {
        --   version = 'LuaJIT',
        --   path = runtime_path,
        -- },
        diagnostics = {
          globals = { 'vim', 'use' },
        },
        -- workspace = {
        --   library = vim.api.nvim_get_runtime_file("", true),
        -- },
        telemetry = {
          enable = false,
        },
      },
    }
  end

  vim.lsp.config(lsp, server_opts)
  vim.lsp.enable(lsp)
end

-- Setup Dart & Flutter LSP separately with the plugin
require('flutter-tools').setup {
  decorations = {
    device = true,
  },
  debugger = {
    enabled = true,
    run_via_dap = true,
  },
  widget_guides = {
    enabled = true,
  },
  lsp = {
    color = {
      enabled = true,
      background = true,
    },
    on_attach = lsp_opts.on_attach,
    capabilities = lsp_opts.capabilities,
  }
}
