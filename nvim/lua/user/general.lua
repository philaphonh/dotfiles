-- Load key mapping config
local map_opts = require('user.settings.mapping_options')

require('kanagawa').setup({
  background = {
    dark = 'dragon'
  }
})

require('auto-dark-mode').setup({
  update_interval = 1000,
  set_dark_mode = function ()
    vim.o.background = 'dark'
  end,
  set_light_mode = function ()
    vim.o.background = 'light'
  end
})

--[[
-- Set properties via native VIM commands such as:
-- 1. Set colorscheme
-- 2. Turns off native syntax highlighting
-- 3. Enable indentation
-- 4. Automatically set file type for files/buffers
--]]-- 
vim.cmd([[
  colorscheme kanagawa
  syntax off
  filetype plugin indent on
  autocmd BufRead,BufEnter *.astro set filetype=astro
  autocmd BufRead,BufEnter *.svelte set filetype=svelte
  autocmd BufRead,BufEnter *.vue set filetype=vue
  autocmd FileType zsh,tmux set filetype=sh
]])

-- General settings
-- Enables 24-bit RGB colors
vim.opt.termguicolors = true
-- Enables mouse support in any modes
vim.opt.mouse = 'a'
-- Uses unnamedplus clipboard
vim.opt.clipboard:append('unnamedplus')
-- Enables the text line
vim.opt.cursorline = true
-- Display line numbers
vim.opt.number = true
-- Display relative line numbers
vim.opt.relativenumber = true
-- Split a new window to the right-hand side
vim.opt.splitright = true
-- Split a new window below
vim.opt.splitbelow = true
-- Jumps to a maching word
vim.opt.showmatch = true
-- Show a list of words
vim.opt.wildmode = 'longest,list'
-- Set a number of spaces when pressing the Tab button
vim.opt.tabstop = 2
-- Set a number of spaces when pressing the Tab button while in edit mode
vim.opt.softtabstop = 2
-- Set a number of spaces for autoindent 
vim.opt.shiftwidth = 2
-- Set a number of space 
vim.opt.expandtab = true
-- Enable smart indentation
vim.opt.smartindent = true
-- Disable swap file
vim.opt.swapfile = false
-- Disables buffers
vim.opt.hidden = true
-- Do not backup files
vim.opt.backup = false
vim.opt.writebackup = false
-- Sets a number of lines for command-line
vim.opt.cmdheight = 2
-- Set a time in seconds to write a swap if in idle
vim.opt.updatetime = 300
-- Turn off completion message
vim.opt.shortmess:append('c')
-- Set a completion in the insert mode
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
-- Always draw the signcolumn
vim.opt.signcolumn = 'yes'

-- General key bindings
-- Jumps to the previous buffer
vim.api.nvim_set_keymap('n', '<space>h', '<cmd>bp <CR>', map_opts)
-- Jumps to the next buffer
vim.api.nvim_set_keymap('n', '<space>l', '<cmd>bn <CR>', map_opts)
-- Writes (save) the buffer
vim.api.nvim_set_keymap('n', '<space>w', '<cmd>bd <CR>', map_opts)
-- Writes (save) the buffer and exit
vim.api.nvim_set_keymap('n', '<leader>wq', '<cmd>wq <CR>', map_opts)
-- Exit
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>q <CR>', map_opts)
