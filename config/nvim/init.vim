""" Basic settings
let mapleader = " "
let loaded_netrw=1
let loaded_netrwPlugin=1
set encoding=utf-8
set nocompatible

""" Vundle plugin management
set rtp+=~/.config/nvim/bundle/Vundle.vim
filetype off
call vundle#rc("~/.config/nvim/bundle")
runtime config/plugins.vim  " contains all plugins

""" Additional configs
"" General, mostly plugin independant settings
runtime config/lookandfeel.vim
runtime config/mappings.vim " custom plugin-independant mappings
runtime config/folding.vim
runtime config/indentation.vim
runtime config/search.vim
runtime config/misc.vim

"" Plugin-related configs
runtime config/airline.vim  " fancy status line
runtime config/git.vim      " git or fugitive related
runtime config/fzf.vim    " fuzzy search files
runtime config/coc.vim      " nodejs extension host
runtime config/nvimtree.vim " explorer-like file tree

"" Vimwiki
runtime config/vimwiki.vim
runtime config/gnupg.vim

"" AI stuff, disabled globally in config below
runtime config/copilot.vim  " github copilot
