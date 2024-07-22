autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

" "Contributed on behalf of" hook
map <Leader>cob :call ContributedOnBehalfOf()<CR>
funct! ContributedOnBehalfOf()
	exe 'put =\"Contributed on behalf of ' . GetCustomer() . '\"'
endfunct
func! GetCustomer()
	return system('git config --null --get user.contributedfor | tr -d "\0"')
endfunct
