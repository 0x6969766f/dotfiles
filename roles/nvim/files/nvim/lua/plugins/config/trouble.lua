local ok_trouble, trouble = pcall(require, "trouble")
if not ok_trouble then
  return
end

vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {
    silent = true,
    noremap = true
  }
)

trouble.setup()