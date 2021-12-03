sudo apt install zsh -y
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh -y
sed -i "s/\=\"robbyrussell/\=\"jonathan/g" ~/.zshrc
