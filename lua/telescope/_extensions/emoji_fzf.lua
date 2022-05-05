local has_telescope, telescope = pcall(require, 'telescope')
local main = require('telescope._extensions.emoji_fzf.main')

if not has_telescope then
  error('This plugins requires nvim-telescope/telescope.nvim')
end

return telescope.register_extension {
  exports = {
    emoji_fzf = main.emoji_fzf,
  }
}
