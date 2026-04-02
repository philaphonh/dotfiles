local map_opts = require('user.settings.mapping_options')

require('nvim-tree').setup {
  view = {
    side = 'left',
    number = true,
    relativenumber = true,
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  },
  filters = {
    custom = {
      "^.git$",
      "^node_modules$"
    }
  }
}

vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>NvimTreeToggle <CR>', map_opts)
