
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--toggle nvim-tree
vim.keymap.set("n", "<F3>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
--

-- auto close nvim-tree when it's the last window
vim.cmd[[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]

require("nvim-tree").setup({
  autoclose = true,
  sort_by = "case_sensitive",
  view = {
    width = 30,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "<Tab>", action = "tabnew" },
        { key = "<C-p>", action = "preview" },
      },
    },
  },
  renderer = {
    group_empty = true,
	indent_markers = {
		enable = true,
		inline_arrows = true,
		icons = {
			corner = "└",
			edge = "│",
			item = "│",
			bottom = "─",
			none = " ",
		},
	},
	icons = {
		webdev_colors = true,
		git_placement = "before",
		modified_placement = "after",
		padding = " ",
		symlink_arrow = " ➛ ",
		show = {
			file = true,
			folder = true,
			folder_arrow = true,
			git = true,
			modified = true,
		},
		glyphs = {
			default = "",
			symlink = "",
			bookmark = "",
			modified = "●",
			folder = {
				arrow_closed = "",
				arrow_open = "",
				default = "",
				open = "",
				empty = "",
				empty_open = "",
				symlink = "",
				symlink_open = "",
			},
			git = {
				unstaged = "✗",
				staged = "✓",
				unmerged = "",
				renamed = "➜",
				untracked = "★",
				deleted = "",
				ignored = "◌",
			},
		},
	},
  },
  filters = {
    dotfiles = false,
  },
  update_cwd = true,
})
