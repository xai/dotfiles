" Copilot
" Ensure that this is not enable by default for any filetypes
let g:copilot_filetypes = {
			\ '*': v:false,
			\ }

" explicitly disable globally to avoid sending data accidentally
" verify this by running :Copilot status, it should say 'Disabled globally'
let g:copilot_enabled = v:false

" Toggle copilot for buffer
nnoremap <leader>cp :call ToggleCopilot()<CR>
function! ToggleCopilot()
	if (!exists("b:copilot_enabled") || (b:copilot_enabled == v:false))
		let b:copilot_enabled = v:true
		echo "Copilot enabled"
	else
		let b:copilot_enabled = v:false
		echo "Copilot disabled"
	endif
endfunction

