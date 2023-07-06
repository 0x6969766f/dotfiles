local ok, _ = pcall(vim.cmd, "colorscheme catppuccin-mocha")
if not ok then
  print "Colorscheme not found!"
  return
end
