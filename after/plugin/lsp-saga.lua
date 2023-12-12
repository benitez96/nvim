
-- local status, saga = pcall(require, "lspsaga")
-- if (not status) then return end

-- saga.init_lsp_saga {
-- 	-- server_filetype_map = {
-- 	-- 	typescript = { 'typescript', 'html' },
-- 	-- },

-- 	finder_action_keys = {
-- 		vsplit = "v",
-- 		split = "s",
-- 		tabe = "<C-t>",
-- 	}
-- }

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga finder<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
