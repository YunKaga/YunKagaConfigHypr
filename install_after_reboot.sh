#!/bin/bash

mv ~/.config/.zshrc ~/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zshrc

cd ~/gitclone/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -Sy spotify zoom
