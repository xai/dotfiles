# dotfiles
Just my dotfiles... Don't blame me when they break your stuff.

## Requirements
Some of the things I use need the powerline fonts.  
See the [official powerline documentation](https://powerline.readthedocs.org/en/master/installation.html#patched-fonts) for patching or [powerline-fonts](https://github.com/powerline/fonts) for using prepatched versions.  
Note that I don't use powerline and that the installation of powerline itself is not necessary for my configs. I just use the fonts.

My tmux config requires `xclip` to be installed.

## vimrc

I use [neovim](https://github.com/neovim/neovim), a project that I endorse a lot. Therefore, you can safely assume that my vimrc plays well with neovim.

### Installation
1. `cp /path/to/dotfiles/vimrc $HOME/.vimrc`
2. `mkdir -p $HOME/.vim/bundle`
3. `git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim`
4. `vim -c PluginInstall`

## Xresources
Use https://github.com/xai/Xresources.edit to generate `$HOME/.Xresources` using `$HOME/Xresources.src`.

## tmux
Tmux plugin manager is needed, so you have to clone it first:

`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
