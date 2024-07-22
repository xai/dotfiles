set nocompatible

let mapleader = " "
syntax on
set number
set encoding=utf-8
set fillchars=vert:\│

set rtp+=~/.vim/bundle/Vundle.vim
filetype off
call vundle#rc()

" Features
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'

" Colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'sheerun/vim-wombat-scheme'

set background=dark
colorscheme solarized
