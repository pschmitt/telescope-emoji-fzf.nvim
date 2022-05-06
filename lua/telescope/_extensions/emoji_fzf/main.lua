local M = {}

local conf = require("telescope.config").values
local finders = require "telescope.finders"
local pickers = require "telescope.pickers"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

-- our picker function: emoji_fzf
M.emoji_fzf = function(opts)
  opts = opts or {}

  local command = vim.F.if_nil(opts.command, { "emoji-fzf", "preview", "--prepend" })

  opts.default_text = opts.search or vim.fn.expand "<cword>"

  opts.entry_maker = function(entry)
    local words = {}
    words["emoji"], words["tags"] = entry:match("^(%S+)%s+(%w+)")

    return {
      value = words["emoji"],
      display = entry,
      ordinal = entry
    }
  end

  pickers.new(opts, {
    prompt_title = "🤣 emoji-fzf",
    finder = finders.new_oneshot_job(
      vim.tbl_flatten { command, },
      opts
    ),
    -- previewer = conf.file_previewer(opts),
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        -- print(vim.inspect(selection))
        -- print(vim.inspect(selection.value))
        -- vim.api.nvim_put({ selection.value }, "", false, true)
        -- Replace current word
        vim.cmd("normal! ciw")
        vim.api.nvim_put({ selection.value }, "", true, true)
        -- Clear cmdline
        vim.cmd("echon ''")
      end)
      return true
    end,
  }):find()
end

-- to execute the function
-- M.emoji_fzf()

return M
