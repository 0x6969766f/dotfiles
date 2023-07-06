local ok, blankline = pcall(require, "indent-blankline")
if not ok then
  return
end

blankline.setup({
  char = "┊",
  show_trailing_blankline_indent = false,
})