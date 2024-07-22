filetype plugin indent on
autocmd FileType c,php,perl,bash,python let &colorcolumn="80,".join(range(120,999),",")
autocmd FileType java let &colorcolumn="100,".join(range(120,999),",")
autocmd FileType tex set modeline
set undofile

