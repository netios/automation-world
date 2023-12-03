sudo apt install -y unzip
sudo apt install -y zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
#sh install.sh                    # default Y
sed -i "s/\=\"robbyrussell/\=\"jonathan/g" ~/.zshrc
sed -i "\$aalias h=\"history -i\"" ~/.zshrc
sed -i "\$aalias hs=\"history -i | grep\"" ~/.zshrc
sed -i "\$aalias k=\"kubectl\"" ~/.zshrc
sed -i "\$aalias k9s=\"k9 --logoless\"" ~/.zshrc
cat <<EOF >> ~/.zshrc
#_____ history for zsh
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
#_____ remap key
bindkey "\033[1~" beginning-of-line   # zsh: home key
bindkey "\033[4~" end-of-line         # zsh: end key
bindkey '\e\e[C' forward-word         # zsh: ctrl + alt + right arrow key
bindkey '\e\e[D' backward-word        # zsh: ctrl + alt + left arrow key
EOF

echo "#_____ [zsh_plugin] Auto Suggestions" >> ~/.zshrc 
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "#_____ [zsh_plugin] Syntax Highlighting" >> ~/.zshrc 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "#_____ [zsh_plugin] Completions" >> ~/.zshrc 
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
echo "source ~/.oh-my-zsh/custom/plugins/zsh-completions/zsh-completions.plugin.zsh" >> ~/.zshrc
source ~/.zshrc
chsh -s /usr/bin/zsh

############## ubuntu 20.x ---> ubuntu 22.x 
# sudo apt update && sudo apt dist-upgrade
# sudo apt install update-manager-core
# do-release-upgrade -d

#_____ awscli v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

#_____ kubectl
# sudo apt install -y kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#_____ kubectl zsh auto-completion
source <(kubectl completion zsh)
echo 'compdef __start_kubectl k' >> ~/.zshrc
autoload -Uz compinit
compinit

#_____ kubecolor
curl -sS https://raw.githubusercontent.com/netios/automation-world/main/k8s/kubecolor_install.sh | bash

#_____ helm3
sudo snap install helm --classic

#_____ opentofu
sudo snap install opentofu --classic

#_____ k9s
sudo curl -sS https://webinstall.dev/k9s | bash

sudo apt install -y bsdmainutils
sudo apt install -y jq
sudo apt install -y ipcalc
sudo apt install -y duf

#_____ fzf, bat
sudo apt install -y fzf
sudo apt install -y bat
ln -s /usr/bin/batcat ~/bin/bat 
echo "#_____ fzf preview config" >> ~/.zshrc
echo "export FZF_DEFAULT_OPTS=\"--preview 'bat --theme ansi --color=always {}'\"" >> ~/.zshrc

#______ xh
curl -sfL https://raw.githubusercontent.com/ducaale/xh/master/install.sh | sh

#______ delta
xh -d https://github.com/dandavison/delta/releases/download/0.16.5/git-delta-musl_0.16.5_amd64.deb
sudo dpkg -i git-delta-musl_0.16.5_amd64.deb
cat <<EOF >> ~/.gitconfig
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true
    light = true  # dark = true
    side-by-side = true

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default
EOF



