-- Setup auto closing for markup languages
require('nvim-ts-autotag').setup()
-- Setup auto pairing
require('nvim-autopairs').setup {
  disable_filetype = { "TelescopePrompt", "vim" },
  check_ts = true,
  enable_check_bracket_link = true,
}
