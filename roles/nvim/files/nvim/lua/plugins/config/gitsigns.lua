local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
	return
end

vim.keymap.set("n", "<leader>gp", require("gitsigns").prev_hunk, { buffer = bufnr, desc = "[G]o to [P]revious Hunk" })
vim.keymap.set("n", "<leader>gn", require("gitsigns").next_hunk, { buffer = bufnr, desc = "[G]o to [N]ext Hunk" })
vim.keymap.set("n", "<leader>ph", require("gitsigns").preview_hunk, { buffer = bufnr, desc = "[P]review [H]unk" })

gitsigns.setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})
