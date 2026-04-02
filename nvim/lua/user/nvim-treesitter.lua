require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'javascript',
    'typescript',
    'html',
    'css',
    'vue',
    'svelte',
    'astro',
    'tsx',
    'go',
    'rust',
    'dart',
    'lua',
    'yaml',
    'toml',
    'markdown',
    'json',
  },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil
  }
}
