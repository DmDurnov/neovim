local ok_toggleterm, toggleterm = pcall(require, 'toggleterm')
if not ok_toggleterm then
   print('toggleterm not available')
   return
end

toggleterm.setup{
   direction = 'float',
}
