#!/bin/bash

setfont cyr-sun16

sudo systemctl enable sddm

mkdir ~/gitclone/
cd ~/gitclone/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -Sy spotify zoom

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
sudo cp -r /usr/share/zsh/plugins/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/
sudo cp -r /usr/share/zsh/plugins/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/
