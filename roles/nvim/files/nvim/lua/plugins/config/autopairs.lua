local ok_autopairs, autopairs = pcall(require, "nvim-autopairs")
if not ok_autopairs then
	return
end

autopairs.setup({
	check_ts = true, -- enable treesitter
	ts_config = {
		lua = { "string" }, -- don't add pairs in lua string treesitter nodes
		javascript = { "template_string" }, -- don't add pairs in javascript template_strings
		java = false, -- don't check treesitter on java
	},
})

local ok_cmp_autopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not ok_cmp_autopairs then
	return
end

local ok_cmp, cmp = pcall(require, "cmp")
if not ok_cmp then
	return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
