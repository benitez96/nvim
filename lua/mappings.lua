vim.g.mapleader = ';'

-- Split window
vim.keymap.set('n', '<leader>s', ':split<Return><C-w>w', { silent = true })
vim.keymap.set('n', '<leader>v', ':vsplit<Return><C-w>w', { silent = true })
-- Move window

vim.keymap.set('', '<C-h>', '<C-w>h')
vim.keymap.set('', '<C-k>', '<C-w>k')
vim.keymap.set('', '<C-j>', '<C-w>j')
vim.keymap.set('', '<C-l>', '<C-w>l')
vim.keymap.set('x', '<leader>p', "\"_dP")

-- Insesitive when closing
vim.cmd([[cnoreabbrev W! w!]])
vim.cmd([[cnoreabbrev Q! q!]])
vim.cmd([[cnoreabbrev Qall! qall!]])
vim.cmd([[cnoreabbrev Wq wq]])
vim.cmd([[cnoreabbrev Wa wa]])
vim.cmd([[cnoreabbrev wQ wq]])
vim.cmd([[cnoreabbrev WQ wq]])
vim.cmd([[cnoreabbrev W w]])
vim.cmd([[cnoreabbrev Q q]])
vim.cmd([[cnoreabbrev Qall qall]])

-- Save and close files
vim.cmd([[nnoremap <C-s> :w<CR>]])
vim.cmd([[nnoremap <C-q> :wq!<CR>]])


-- Move visual block
vim.cmd([[vnoremap J :m '>+1<CR>gv=gv]])
vim.cmd([[vnoremap K :m '<-2<CR>gv=gv]])

-- Vmap for maintain Visual Mode after shifting > and <
vim.cmd([[vmap < <gv]])
vim.cmd([[vmap > >gv]])

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
