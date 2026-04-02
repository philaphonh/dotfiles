-- TODO: Load debug configs from launch.json file
local dap = require('dap')
require('dapui').setup()
local map_opts = require('user.settings.mapping_options')

vim.api.nvim_set_keymap('n', '<F5>', "<cmd>lua require('dap').continue() <CR>", map_opts)
vim.api.nvim_set_keymap('n', '<F9>', "<cmd>lua require('dap').toggle_breakpoint() <CR>", map_opts)
vim.api.nvim_set_keymap('n', '<F10>', "<cmd>lua require('dap').step_over() <CR>", map_opts)
vim.api.nvim_set_keymap('n', '<F11>', "<cmd>lua require('dap').step_into() <CR>", map_opts)
vim.api.nvim_set_keymap('n', '<F12>', "<cmd>lua require('dap').step_out() <CR>", map_opts)
vim.api.nvim_set_keymap('n', '<leader>dc', "<cmd>lua require('dapui').toggle() <CR>", map_opts)

-- Using Delve for debugging Go
dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = vim.fn.exepath('dlv'),
    args = {'dap', '-l', '127.0.0.1:${port}'}
  }
}

-- Default debug configuration for Go
dap.configurations.go = {
  {
    type = 'delve',
    name = 'Debug Go',
    request = 'launch',
    program = '${file}',
  }
}

-- CodeLLDB adapter configuration
dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = vim.fn.exepath('codelldb'),
    args = {'--port', '${port}'},
  }
}

-- Debug configurations for C/C++/Rust
-- Prioritise Rust
dap.configurations.rust = {
  {
    name = 'Launch',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {}
  }
}
dap.configurations.c = dap.configurations.rust
dap.configurations.cpp = dap.configurations.rust
