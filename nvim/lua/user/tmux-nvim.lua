local map_opts = require('user.settings.mapping_options')

vim.api.nvim_set_keymap('n', "<C-h>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", map_opts)
vim.api.nvim_set_keymap('n', "<C-j>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", map_opts)
vim.api.nvim_set_keymap('n', "<C-k>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", map_opts)
vim.api.nvim_set_keymap('n', "<C-l>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", map_opts)
