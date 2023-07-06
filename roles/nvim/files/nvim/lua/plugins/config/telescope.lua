local ok_telescope, telescope = pcall(require, "telescope")
if not ok_telescope then
  return
end

local ok_actions, actions = pcall(require, "telescope.actions")
if not ok_actions then
  return
end

local ok_themes, themes = pcall(require, "telescope.themes")
if not ok_themes then
  return
end

vim.keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fs", "<CMD>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fc", "<CMD>Telescope grep_string<CR>")
vim.keymap.set("n", "<leader>fb", "<CMD>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fh", "<CMD>Telescope help_tags<CR>")

telescope.setup({
  defaults = {
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    entry_prefix = "  ",
    extensions = {
      ["ui-select"] = {
        themes.get_dropdown({}),
      }
    },
    file_ignore_patterns = { "node_modules" },
    initial_mode = "insert",
    layout_config = {
      height = 0.80,
      horizontal = {
        preview_width = 0.55,
        prompt_position = "top",
        results_width = 0.8,
      },
      preview_cutoff = 120,
      vertical = {
        mirror = false,
      },
      width = 0.87,
    },
    layout_strategy = "horizontal",
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      }
    },
    path_display = { "truncate" },
    prompt_prefix = " ?  ",
    selection_caret = "  ",
    selection_strategy = "reset",
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    sorting_strategy = "ascending",
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    winblend = 0,
  }
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
