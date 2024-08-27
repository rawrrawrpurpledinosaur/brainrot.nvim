if exists('g:loaded_brainrot')
	finish | endif 
let g:loaded_brainrot = 1

command! Brainrot lua require('brainrot').start()
