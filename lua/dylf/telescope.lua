require('telescope').setup {
  defaults = {
  }
}

require('telescope').load_extension('fzf')

local mappings = {}

mappings.curr_buf = function()
  local opt = require('telescope.themes').get_dropdown({ winblend = 10 })
  require ('telescope.builtin').current_buffer_fuzzy_find(opt)
end

return mappings
