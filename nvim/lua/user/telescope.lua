local map_opts = require('user.settings.mapping_options')

local telescope = require('telescope')
local actions = require('telescope.actions')
local actions_layout = require('telescope.actions.layout')
local previewers = require('telescope.previewers')
local Job = require('plenary.job')
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "Binary cannot be previewed..." })
        end)
      end
    end
  }):sync()
end


telescope.setup {
  defaults = {
    hidden = true,
    file_ignore_patterns = { "node_modules", ".git" },
    buffer_previewer_maker = new_maker,
    mappings = {
      n = {
        ["<M-p>"] = actions_layout.toggle_preview
      },
      i = {
        ["<Esc>"] = actions.close,
        ["<C-u>"] = false,
        ["<M-p>"] = actions_layout.toggle_preview
      }
    }
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--hidden", "--no-ignore" }
    },
  },
  extensions = {
    file_browser = {
      hidden = {
        file_browser = true,
        folder_browser = true,
      },
      respect_gitignore = false,
    }
  }
}

pcall(telescope.load_extension, "flutter")
pcall(telescope.load_extension, "file_browser")
pcall(telescope.load_extension, "media_files")
pcall(telescope.load_extension, "dap")

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files <CR>', map_opts)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep <CR>', map_opts)
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers <CR>', map_opts)
vim.api.nvim_set_keymap('n', '<leader>fe', '<cmd>Telescope file_browser <CR>', map_opts)
vim.api.nvim_set_keymap('n', '<leader>fm', '<cmd>Telescope media_files <CR>', map_opts)
vim.api.nvim_set_keymap('n', '<leader>fd', '<cmd>Telescope dap commands <CR>', map_opts)
