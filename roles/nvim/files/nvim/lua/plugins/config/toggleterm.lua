local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
	return
end

toggleterm.setup({
	close_on_exit = true,
	direction = "float",
	float_opts = {
		border = "curved",
		highlights = {
			border = "Normal",
			background = "Normal",
		},
		winblend = 0,
	},
	hide_numbers = true,
	insert_mappings = true,
	open_mapping = [[<C-t>]],
	persist_size = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	shell = vim.o.shell,
	size = 20,
	start_in_insert = true,
})
