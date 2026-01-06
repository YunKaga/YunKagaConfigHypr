#!/bin/bash

# Конфиги
mkdir ~/.config
rm -r ./README.md ./preview
mv ./* ~/.config/
mv ./.git ~/.config/
cd /

sudo systemctl enable sddm

cd ~/gitclone/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -Sy spotify zoom

rm ~/.zshrc
mv ~/.config/.zshrc ~/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
source ~/.zshrc

