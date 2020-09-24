#!/bin/bash
# Simple setup.sh for configuring Fedora instance

sudo dnf install -y mc
sudo dnf install -y vim
sudo dnf install -y terminator
sudo dnf install -y zsh
sudo dnf install -y util-linux-user
chsh -s $(which zsh)

#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo Downloading oh-my-zsh install script, please check if it is ok before running
curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

sudo dnf install -y fzf
sudo dnf install -y htop
sudo dnf install -y make
sudo dnf install -y tldr

sudo dnf install -y NetworkManager-openvpn NetworkManager-openvpn-gnome

cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/brybacki/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .

