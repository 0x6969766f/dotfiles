local ok, rename= pcall(require, "inc-rename")
if not ok then
  return
end

rename.setup()
