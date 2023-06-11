
-- DAP Mappings
vim.keymap.set('n', '<F5>', '<cmd>lua require"dap".continue()<CR>')
vim.keymap.set('n', '<F10>', '<cmd>lua require"dap".step_over()<CR>')
vim.keymap.set('n', '<F11>', '<cmd>lua require"dap".step_into()<CR>')
vim.keymap.set('n', '<F12>', '<cmd>lua require"dap".step_out()<CR>')
vim.keymap.set('n', '<leader>b', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
vim.keymap.set('n', '<F6>', '<cmd>lua require"dap".repl.open()<CR>')


vim.keymap.set('n', '<leader>dsbr',
          '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
vim.keymap.set('n', '<leader>dsbm',
          '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
vim.keymap.set('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>')
vim.keymap.set('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>')


-- DAP UI Mappings
vim.keymap.set('n', '<leader>dui', '<cmd>lua require"dapui".toggle()<CR>')

vim.keymap.set('n', '<leader>dsc', '<cmd>lua require"dap.ui.variables".scopes()<CR>')
vim.keymap.set('n', '<leader>dhh', '<cmd>lua require"dap.ui.variables".hover()<CR>')
vim.keymap.set('v', '<leader>dhv',
          '<cmd>lua require"dap.ui.variables".visual_hover()<CR>')

vim.keymap.set('n', '<leader>duh', '<cmd>lua require"dap.ui.widgets".hover()<CR>')
vim.keymap.set('n', '<leader>duf',
          "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")



-- Telescope DAP Mappings
vim.keymap.set('n', '<leader>dcc',
          '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
vim.keymap.set('n', '<leader>dco',
          '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
vim.keymap.set('n', '<leader>dlb',
          '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
vim.keymap.set('n', '<leader>dv',
          '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
vim.keymap.set('n', '<leader>df',
          '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')


-- DAP Virtual Text
vim.g.dap_virtual_text = true



-- DAP Configs

vim.fn.sign_define('DapBreakpoint',{ text ='𖢥', guifg = '#993939', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='→', texthl ='', linehl ='', numhl =''})


require('nvim-dap-virtual-text').setup()
-- require('dap').setup({})
require('dapui').setup()

local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end


require('dbg.javascript')
require('dbg.python')


