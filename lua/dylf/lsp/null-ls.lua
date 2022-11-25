local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
  vim.notify('null-ls not installed!')
  return
end

 null_ls.setup({
 })
