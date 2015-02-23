# dotfiles
Just my dotfiles... Don't blame me when they break your stuff.

## Requirements
Some of the things I use need the powerline fonts.  
See the [official powerline documentation](https://powerline.readthedocs.org/en/master/installation.html#patched-fonts) for patching or [powerline-fonts](https://github.com/powerline/fonts) for using prepatched versions.  
Note that I don't use powerline and that the installation of powerline itself is not necessary for my configs. I just use the fonts.

## vimrc
### Installation
1. `cp /path/to/dotfiles/vimrc $HOME/.vimrc`
2. `mkdir -p $HOME/.vim/bundle`
3. `git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Bundle.vim`
4. `vim -c PluginInstall`
