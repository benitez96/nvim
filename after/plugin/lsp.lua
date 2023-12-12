local lspkind = require('lspkind')
local lsp_zero = require('lsp-zero')

local function formatForTailwindCSS(entry, vim_item)
	if vim_item.kind == 'Color' and entry.completion_item.documentation then
		local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')
		if r then
			local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
			local group = 'Tw_' .. color
			if vim.fn.hlID(group) < 1 then
				vim.api.nvim_set_hl(0, group, { fg = '#' .. color })
			end
			vim_item.kind = "●"
			vim_item.kind_hl_group = group
			return vim_item
		end
	end
	vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
	return vim_item
end

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver', 
    'html',
    'pyright',
    'tailwindcss',
    'tsserver',
    'astro',
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
  },
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
			before = function(entry, vim_item)
				vim_item = formatForTailwindCSS(entry, vim_item)
				return vim_item
			end
		})
	},
	mapping = cmp_mappings,
})

