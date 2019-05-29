# dotfiles
Just my dotfiles... Don't blame me when they break your stuff.

## bashrc

### bash-git-prompt
`git clone https://github.com/magicmonty/bash-git-prompt $HOME/.bash-git-prompt`

## vimrc

### Installation
1. `ln -s /path/to/dotfiles/vimrc $HOME/.vimrc`
2. `mkdir -p $HOME/.vim/bundle`
3. `git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim`
4. `vim -c PluginInstall`

## tmux
`ln -s /path/to/dotfiles/tmux.conf $HOME/.tmux.conf`

## gnome-shell

### Workspaces
I typically use 8-12 static workspaces with those keybindings:

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

### Switching Windows (alternatetab like)
Alternate tab extension doesn't work with gnome shell > 3.32 and it never did much anyway.  
To achieve the same results, run  
`gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"`

### Fix ugly terminal menu bar (>3.32)
`gsettings set org.gnome.Terminal.Legacy.Settings headerbar "@mb false"`

### Extensions
I need some extensions to be productive with gnome-shell:
* [no topleft hot corner](https://extensions.gnome.org/extension/118/no-topleft-hot-corner/)
* [pixel saver (fork)](https://extensions.gnome.org/extension/1638/pixel-saver-fork/)
* [workspace indicator](https://extensions.gnome.org/extension/21/workspace-indicator/)
* [topicons (plus)](https://extensions.gnome.org/extension/1031/topicons/)
* [launch new instance](https://extensions.gnome.org/extension/600/launch-new-instance/)
* [caffeine](https://extensions.gnome.org/extension/517/caffeine/)
* [mailnag](https://extensions.gnome.org/extension/886/mailnag/)