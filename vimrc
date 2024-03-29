set nocompatible

syntax on
set number
set enc=utf-8
set fillchars=vert:\│

set rtp+=~/.vim/bundle/Vundle.vim
filetype off
call vundle#rc()

"
" Features
"
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sleuth'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'aperezdc/vim-template'
"Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'itchyny/thumbnail.vim'
"Plugin 'jalvesaq/Nvim-R'
Plugin 'jamessan/vim-gnupg'
"Plugin 'jeffkreeftmeijer/vim-numbertoggle'
"Plugin 'kien/ctrlp.vim'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'majutsushi/tagbar'
Plugin 'nvie/vim-flake8'
"Plugin 'scrooloose/nerdcommenter.git'
"Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/syntastic'
"Plugin 'szw/vim-dict'
Plugin 'tfnico/vim-gradle'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/CmdlineComplete'
Plugin 'vim-scripts/git_patch_tags.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'masukomi/vim-markdown-folding'
Plugin 'junegunn/fzf'
"Plugin 'neomake/neomake'
"Plugin 'Shougo/deoplete.nvim'
"Plugin 'tpope/vim-dispatch'
"Plugin 'vim-scripts/vim-auto-save'
"Plugin 'mreppen/vim-scholar'
Plugin 'voldikss/vim-translator'
Plugin 'xai/vim-scholar'
Plugin 'sainnhe/gruvbox-material'
Plugin 'psf/black'
Plugin 'vimwiki/vimwiki'

"
" Colorschemes
"
Plugin 'vim-scripts/Lucius'
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sheerun/vim-wombat-scheme'
Plugin 'EdenEast/nightfox.nvim'

filetype plugin indent on

" define leader key
let mapleader = " "

" Setup for vim-template
let g:username='Olaf Lessenich'
let g:email='xai@linux.com'

" Save buffer automatically
" autocmd FileType java,python let auto_save = 1

let python_highlight_all=1

set showmatch
set incsearch
set history=10000
"autocmd FileType java,c,php,python,perl,bash set colorcolumn=80
autocmd FileType c,php,perl,bash,python let &colorcolumn="80,".join(range(120,999),",")
autocmd FileType java let &colorcolumn="100,".join(range(120,999),",")
autocmd FileType tex set modeline
"autocmd FileType tex match ErrorMsg '\%>86v.\+'
"autocmd FileType tex highlight ExtraWhitespace ctermbg=red guibg=red
"autocmd FileType tex match ExtraWhitespace /\s\+$/

" Set the working directory to wherever the open file lives
"set autochdir

set autoread

" Search in current subdirs
set path+=**

" Show file options above the command line
set wildmenu

" nnoremap <C-p> :find *
nnoremap <C-p> :FZF<CR>

" gradle syntax highlighting
au BufNewFile,BufRead *.gradle set filetype=groovy

"let g:airline_theme='powerlineish'
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline#extensions#eclim#enabled = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

set laststatus=2
set t_Co=256

"let g:EclimProjectTreeAutoOpen=1
"let g:EclimJavaSearchSingleResult='tabnew'

" for YCM
"let g:EclimCompletionMethod = 'omnifunc'
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
""Do not ask when starting vim
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_autoclose_preview_window_after_completion=1
"set tags+=./.tags

" gnupg
"let g:GPGExecutable = 'gpg2'

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
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
let g:syntastic_check_on_wq = 1

" configure checkers
let g:syntastic_tex_checkers = ["chktex"]
"let g:syntastic_java_checkers = ['javac']
"let g:syntastic_java_javac_config_file_enabled = 1
" disable syntastic when using YCM's experimental java support
let g:syntastic_java_checkers = []

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" neomake
let g:neomake_error_sign = {'text': '☢', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '⚡', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '☛', 'texthl': 'NeomakeMessageSign'}
let g:neomake_open_list = 1
"autocmd! BufWritePost * Neomake

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
"call matchadd('MyWarnings', '\%>86v.\+')
call matchadd('MyFixme', '\s\+$')

" Always start on first line of git commit message
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

" LaTeX
let g:tex_flavor='latex'
" use --server SOMENAME to use async
"let g:LatexBox_latexmk_async=1
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_viewer='evince'
" The quickfix window is opened automatically if not empty but the cursor
" stays in the current window.
let g:LatexBox_quickfix=2
autocmd FileType tex imap <buffer> [[     \begin{
autocmd FileType tex imap <buffer> ]]     <Plug>LatexCloseCurEnv
autocmd FileType tex nmap <buffer> <F5>   <Plug>LatexChangeEnv
autocmd FileType tex vmap <buffer> <F7>   <Plug>LatexWrapSelection
autocmd FileType tex vmap <buffer> <S-F7> <Plug>LatexEnvWrapSelection
autocmd FileType tex imap <buffer> ((     \eqref{

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

" CtrlP
nnoremap <Leader>r :CtrlPMRU<CR>
nnoremap <Leader>p :CtrlP<CR>

" Unite
nnoremap <Leader>ur :Unite file_rec<CR>
nnoremap <Leader>uf :Unite file<CR>
nnoremap <Leader>ub :Unite buffer<CR>

" eclim
" autocmd FileType java nnoremap <Leader>g :JavaSearchContext<CR>
" autocmd FileType java nnoremap <Leader>c :JavaCallHierarchy<CR>
" autocmd FileType java nnoremap <Leader>j :JavaDocComment<CR>
" autocmd FileType java nnoremap <Leader>i :JavaImportOrganize<CR>

" JavaComplete
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" file tree style
let g:netrw_liststyle=3
map <leader>k :VimFiler<cr>

" NERDtree
map <leader>n :NERDTreeToggle<CR>

" YCM
autocmd FileType c,cpp,python nnoremap <leader>g :YcmCompleter GoTo<CR>
autocmd FileType c,cpp nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
autocmd FileType c,cpp nnoremap <leader>c :YcmCompleter GoToDeclaration<CR>

" clang-format
map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format-3.7.py<cr>
imap <C-K> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format-3.7.py<cr>

" black format
let g:black_linelength=79

" Fugitive
nnoremap <leader>Gw :Gwrite<CR>
nnoremap <leader>Gc :Gcommit -s<CR>
nnoremap <leader>Gs :Git<CR>
nnoremap <leader>Gd :Gdiff<CR>
nnoremap <leader>GD :Git diff --cached<CR>
nnoremap <leader>Gb :Gblame<CR>
nnoremap <leader>Gp :Gpush<CR>

" really cool gui for git (incl. interactive staging)
nnoremap <leader>gg :!git-cola &<CR>

"--- setup colorscheme ---
" default
set background=dark
colorscheme solarized

" toggle solarized dark<->light
call togglebg#map("<F6>")
let g:solarized_diffmode="high"
"let g:solarized_termcolors=256

" switch between solarized and another scheme (which does well on 16 colors)
let g:profile=1
function! ToggleSchemes()
	if (g:profile == 1)
		set background=light
		colorscheme solarized
		hi Terminal ctermbg=white ctermfg=black guibg=white guifg=black
		let g:profile = 3
	elseif (g:profile == 2)
		set background=dark
		colorscheme solarized
		hi Terminal ctermbg=black ctermfg=white guibg=black guifg=white
		let g:profile = 1
	else
		set background=light
		colorscheme default
		hi Terminal ctermbg=white ctermfg=black guibg=white guifg=black
		let g:profile = 2
	endif
endfunction
nnoremap <F7> :call ToggleSchemes()<CR>
"---

" Syntastic
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lprevious<CR>

hi Terminal ctermbg=black ctermfg=white guibg=black guifg=white
nmap <leader>sh :terminal<CR>

" Navigate in command mode emacs style
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Copy (full) path of current file to paste buffer
nmap cp :let @" = expand("%:p")<cr>

" insert timestamps
nmap <F3> i<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>

" Spell checker
let g:tex_comment_nospell = 1

let g:JavaComplete_ShowExternalCommandsOutput = 1

" Translator
let g:translator_source_lang = 'de'
let g:translator_target_lang = 'en'

" Fold setting
" nested folding for markdown
autocmd FileType markdown set foldexpr=NestedMarkdownFolds()

" Add support for markdown files in tagbar.
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '~/bin/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes --sro=»',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '»',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
"
" vim wiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:GPGFilePattern = '*.\(gpg\|asc\|pgp\)\(.md\)\='

set directory^=$HOME/.vim/tmp//
