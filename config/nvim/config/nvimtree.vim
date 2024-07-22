if has('nvim')
    lua require("nvim-tree").setup()

    nnoremap <silent> <F8> :NvimTreeToggle<CR>
    nnoremap <silent> <F9> :NvimTreeFindFile<CR>
endif
