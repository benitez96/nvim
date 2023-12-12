local builtin = require('telescope.builtin')
local telescope = require('telescope')
local actions = require('telescope.actions')

local fb_actions = require "telescope".extensions.file_browser.actions

-- require('telescope').load_extension('dap')
--
--
--local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>r', builtin.live_grep, {})


