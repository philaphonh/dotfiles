local map_opts = require "user.settings.mapping_options"

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>Lspsaga goto_definition<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>Telescope lsp_definitions<CR>', map_opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>Lspsaga peek_definition<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>', map_opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>Lspsaga hover_doc<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', map_opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>',
  --   map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', map_opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F2>', '<cmd>Lspsaga rename<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', map_opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ac', '<cmd>Lspsaga code_action<CR>',
  --   map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ac', '<cmd>lua vim.lsp.buf.code_action()<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'x', '<leader>ac', '<cmd>lua vim.lsp.buf.code_action()<CR>', map_opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'x', '<leader>ac', '<cmd>Lspsaga code_action<CR>'
  -- , map_opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>Lspsaga finder<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>Telescope lsp_references<CR>', map_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', map_opts)
end

local lsp_options = {
  capabilities = capabilities,
  on_attach = on_attach,
}

return lsp_options
