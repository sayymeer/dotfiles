local nvim_tree = require "nvim-tree"

nvim_tree.setup {
  sort = {
    sorter = "case_sensitive",
  },
  filters = {
    dotfiles = true,
  },
  renderer = {
    group_empty = true,
  },

  disable_netrw = true,
  hijack_netrw = true,
  -- open_on_setup = false,
  -- ignore_ft_on_setup = {},
  -- auto_close = false, -- automatically closes nvim-tree when it's the last window
  -- auto_reload_on_write = true,
  -- open_on_tab = false,
  -- hijack_cursor = true,
  -- update_cwd = true,
  -- update_focused_file = {
  --   enable = true,
  --   update_cwd = true,
  -- },
  -- view = {
  --   width = 30,
  --   side = "left",
  --   auto_resize = true,
  --   mappings = {
  --     custom_only = false,
  --     list = {},
  --   },
  -- },
}
