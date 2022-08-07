local ok, iswap = pcall(require, "iswap")
if not ok then
  return
end

iswap.setup {}
