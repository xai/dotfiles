# dotfiles
Just my dotfiles... Don't blame me when they break your stuff.

## Requirements

Some of the things I use need the powerline fonts.  
See the [official powerline documentation](https://powerline.readthedocs.org/en/master/installation.html#patched-fonts) for patching or [powerline-fonts](https://github.com/powerline/fonts) for using prepatched versions.  
Note that I don't use powerline and that the installation of powerline itself is not necessary for my configs. I just use the fonts.

## bashrc

Optionally, you might want to install the following optional pieces:
* [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt): enable git prompt when in repo dir
* [fzf](https://github.com/junegunn/fzf): fuzzy search

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

Then reload `.tmux.conf` and press `PREFIX-I` to install the plugins.

## gnome-shell

I typically use 12 static workspaces with those keybindings:

`Ctrl-Fx`: Switch to workspace x

`Super-Fx`: Move current window to workspace x

These can be easily setup via gsettings:

```
$ for i in $(seq 1 12); do gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Primary>F$i']"; done
```

```
$ for i in $(seq 1 12); do gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Super>F$i']"; done
```

To spawn a terminal emulator fast, I bind `urxvt` to `Super-Return`.

Tabs and titlebars take lots of space by default, so I tweaked my `$HOME/.config/gtk-3.0/gtk.css`.

**Extensions**

I need some extensions to be productive with gnome-shell:
* [no topleft hot corner](https://extensions.gnome.org/extension/118/no-topleft-hot-corner/)
* [pixel saver](https://extensions.gnome.org/extension/723/pixel-saver/)
* [workspace indicator](https://extensions.gnome.org/extension/21/workspace-indicator/)
* [topicons](https://extensions.gnome.org/extension/1031/topicons/)
* [launch new instance](https://extensions.gnome.org/extension/600/launch-new-instance/)
* [alternate tab](https://extensions.gnome.org/extension/15/alternatetab/)
* [caffeine](https://extensions.gnome.org/extension/517/caffeine/)
* [clipboard indicator](https://extensions.gnome.org/extension/779/clipboard-indicator/)
* [freon](https://extensions.gnome.org/extension/841/freon/)
* [mailnag](https://extensions.gnome.org/extension/886/mailnag/)
