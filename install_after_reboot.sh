#!/bin/bash

mv ~/.config/.zshrc ~/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
source ~/.zshrc

cd ~/gitclone/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -Sy spotify zoom
