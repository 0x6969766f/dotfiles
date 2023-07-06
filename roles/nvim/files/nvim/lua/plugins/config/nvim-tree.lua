local ok, nvimtree = pcall(require, "nvim-tree")
if not ok then
  return
end

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.cmd [[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]]

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

nvimtree.setup {
  actions = {
    open_file = {
      resize_window = true,
      window_picker = {
        enable = false,
      },
    },
  },
  disable_netrw = true,
  filesystem_watchers = {
    enable = true,
  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = false,
    ignore = true,
  },
  hijack_cursor = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  renderer = {
    root_folder_label = true,
    highlight_git = false,
    highlight_opened_files = "none",
    icons = {
      glyphs = {
        default = "󰈚",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          deleted = "",
          ignored = "◌",
          renamed = "➜",
          staged = "✓",
          unmerged = "",
          unstaged = "✗",
          untracked = "★",
        },
        symlink = "",
      },
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },
    },
    indent_markers = {
      enable = false,
    },
  },
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    adaptive_size = true,
    preserve_window_proportions = true,
    side = "right",
    width = 30,
  },
}
