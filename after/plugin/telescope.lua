local builtin = require('telescope.builtin')
local telescope = require('telescope')
local actions = require('telescope.actions')

local fb_actions = require "telescope".extensions.file_browser.actions

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end


vim.keymap.set('n', '<leader>r',
function()
	builtin.live_grep()
end)

vim.keymap.set('n', '<leader>f',
function()
	builtin.find_files({
		no_ignore = false,
		hidden = true
	})
end)

vim.keymap.set("n", "ff", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)

vim.keymap.set('n', '<C-p>', builtin.git_files, {})

