# telescope-emoji-fzf.nvim

Extension for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) 
that displays [emoji-fzf](https://github.com/noahp/emoji-fzf) and allows 
selecting one sexy emoji.

# Requirements

- [emoji-fzf](https://github.com/noahp/emoji-fzf)

# Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use {
  "pschmitt/telescope-emoji-fzf.nvim",
  requires = "nvim-telescope/telescope.nvim"
}
```

# Setup

⚠️ You need to register this extension with:

```lua
require("telescope").load_extension("emoji_fzf")
```

LunarVim users, here's how to load a Telescope extension:

```lua
lvim.builtin.telescope.on_config_done = function(tele)
  tele.load_extension("emoji_fzf")
end
```

# Usage

```viml
:Telescope emoji_fzf
```

# Example nvim mapping

```lua
vim.cmd('inoremap <c-e> <Esc>:lua require("telescope-emoji-fzf").emoji_fzf()<CR>')
```
