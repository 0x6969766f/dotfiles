local ok, flash = pcall(require, "flash")
if not ok then
	return
end

vim.keymap.set({ "n", "o", "x" }, "s", function()
	flash.jump({
		search = {
			mode = function(str)
				return "\\<" .. str
			end,
		},
	})
end)

vim.keymap.set({ "n", "o", "x" }, "S", function()
	flash.treesitter()
end)

vim.keymap.set({ "o" }, "r", function()
	flash.remote()
end)

vim.keymap.set({ "o", "x" }, "R", function()
	flash.treesitter_searh()
end)

vim.keymap.set({ "c" }, "<c-s>", function()
	flash.toggle()
end)

flash.setup({ evemt = "VeryLazy", opts = {} })
