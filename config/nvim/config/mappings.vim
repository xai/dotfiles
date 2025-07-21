" Copy (full) path of current file to paste buffer
nmap cp :let @" = expand("%:p")<cr>

" Copy (full) path of current file to X clipboard
nmap cpx :let @+ = expand("%:p")<cr>

" Write current file as sudo
cnoremap w!! execute 'silent! write !SUDO_ASKPASS=`which ssh-askpass` sudo tee % >/dev/null' <bar> edit!
