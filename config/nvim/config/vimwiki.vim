" vim wiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:GPGFilePattern = '*.\(gpg\|asc\|pgp\)\(.md\)\='

" unmap tab key from vim wiki
au filetype vimwiki silent! iunmap <buffer> <Tab>

