return {
	disable_netrw = true, -- disable netrw (recommended)
	hijack_netrw = true, -- hijack netrw window on startup
	-- open_on_setup = false, -- don't open tree automatically on startup
	-- ignore_ft_on_setup = {}, -- ignore these filetypes
	hijack_cursor = true, -- keep cursor on file when opening tree
	update_cwd = true, -- update cwd when changing folders
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 400,
	},
	view = {
		width = 30, -- tree width
		side = "right", -- 👈 open tree on the right
		-- hide_root_folder = false,
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	renderer = {
		add_trailing = false,
		group_empty = true,
		highlight_git = true,
		highlight_opened_files = "icon",
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
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
	sync_root_with_cwd = true, -- optional, keeps tree root in sync
	-- float = {
	-- 	enable = true,
	-- },
	actions = {
		open_file = {
			quit_on_open = false, -- don't close tree when opening file
			resize_window = true,
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
}
