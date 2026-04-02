require('bufferline').setup {
  options = {
    buffer_close_icon = '󱎘',
    close_icon = '󱎘',
    diagnostics = 'nvim_lsp',
    update_in_insert = true,
    ---@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end
  }
}
