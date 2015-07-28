set nocompatible

set background=dark
"set background=light

syntax on
set number
set enc=utf-8
set fillchars=vert:\│

set rtp+=~/.vim/bundle/Vundle.vim
filetype off
call vundle#rc()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/Lucius'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/vimwiki'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'itchyny/thumbnail.vim'
Plugin 'beloglazov/vim-online-thesaurus'
Plugin 'szw/vim-dict'
Plugin 'Shougo/vimfiler.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'tfnico/vim-gradle'

filetype plugin indent on

colorscheme solarized

"let g:solarized_termcolors=256

" indenation
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

set showmatch
set incsearch
set history=10000
"autocmd FileType java,c,php,python,perl,bash set colorcolumn=80
autocmd FileType c,php,python,perl,bash let &colorcolumn="80,".join(range(120,999),",")
autocmd FileType java let &colorcolumn="100,".join(range(120,999),",")
autocmd FileType tex set modeline
"autocmd FileType tex match ErrorMsg '\%>86v.\+'
"autocmd FileType tex highlight ExtraWhitespace ctermbg=red guibg=red
"autocmd FileType tex match ExtraWhitespace /\s\+$/

" gradle syntax highlighting
au BufNewFile,BufRead *.gradle set filetype=groovy

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#eclim#enabled = 1
set laststatus=2
set t_Co=256

let g:EclimProjectTreeAutoOpen=1
let g:EclimJavaSearchSingleResult='tabnew'

" for YCM
let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
let g:ycm_collect_identifiers_from_tags_files = 1
set tags+=./.tags

" Syntastic
let g:syntastic_error_symbol = '☢'
let g:syntastic_warning_symbol = '⚡'
let g:syntastic_style_error_symbol = '☛'
let g:syntastic_style_warning_symbol = '☞'
let g:syntastic_aggregate_errors = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_check_on_open = 1

" configure checkers
let g:syntastic_tex_checkers = ["chktex"]

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Make
nmap <F9> :Make<CR>

" Toggle hlsearch the smart way
let hlstate=0
nnoremap <F5> :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>

highlight MyFixme ctermbg=red guibg=red ctermfg=white guifg=white
highlight MyTodo ctermbg=green guibg=green
highlight MyWarnings ctermfg=red guifg=darkred
call matchadd('MyTodo', '/TODO\|Todo\|todo/')
call matchadd('MyFixme', '/FIXME\|Fixme\|fixme/')
call matchadd('MyWarnings', '\%>86v.\+')
call matchadd('MyFixme', '\s\+$')

" Always start on first line of git commit message
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

" LaTeX
let g:tex_flavor='latex'

" Pulse
"let g:vim_search_pulse_mode = 'cursor_line'
let g:vim_search_pulse_mode = 'pattern'
let g:vim_search_pulse_disable = 0

" Disable indent visualization by default
let g:indentLine_enabled = 0

" insert scissor lines above and below text
function! <SID>Snip() range
    let i = a:firstline
    let maxlen = -2
    " find out the maximum virtual length of each line.
    while i <= a:lastline
      exe i
      let length = virtcol('$')
      let maxlen = (length > maxlen ? length : maxlen)
      let i = i + 1
    endwhile
    let maxlen = (maxlen > &tw && &tw != 0 ? &tw : maxlen)
    let half = maxlen/2
    exe a:lastline
    " put a string below
    exe "norm! o\<esc>".(half - 1)."a-\<esc>A%<\<esc>".(half - 1)."a-"
    " and above. its necessary to put the string below the block of lines
    " first because that way the first line number doesnt change...
    exe a:firstline
    exe "norm! O\<esc>".(half - 1)."a-\<esc>A%<\<esc>".(half - 1)."a-"
endfunction
com! -nargs=0 -range Snip :<line1>,<line2>call <SID>Snip()

" define leader key
let mapleader = " "

" CtrlP
nnoremap <Leader>l :CtrlPMRU<CR>
nnoremap <Leader>p :CtrlP<CR>

" Unite
nnoremap <Leader>ur :Unite file_rec<CR>
nnoremap <Leader>uf :Unite file<CR>
nnoremap <Leader>ub :Unite buffer<CR>

" eclim
autocmd FileType java nnoremap <Leader>g :JavaSearchContext<CR>
autocmd FileType java nnoremap <Leader>c :JavaCallHierarchy<CR>
autocmd FileType java nnoremap <Leader>j :JavaDocComment<CR>
autocmd FileType java nnoremap <Leader>i :JavaImportOrganize<CR>

" file tree style
let g:netrw_liststyle=3
map <leader>k :VimFiler<cr>

" YCM
autocmd FileType c,cpp nnoremap <leader>g :YcmCompleter GoTo<CR>
autocmd FileType c,cpp nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
autocmd FileType c,cpp nnoremap <leader>c :YcmCompleter GoToDeclaration<CR>

" clang-format
map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format-3.7.py<cr>
imap <C-K> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format-3.7.py<cr>

" Fugitive
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gc :Gcommit -s<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gp :Gpush<CR>

" really cool gui for git (incl. interactive staging)
nnoremap <leader>gg :!git-cola &<CR>

" thesaurus
nnoremap <leader>s :OnlineThesaurusCurrentWord<CR>

" easy switching between splits
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
