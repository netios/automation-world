### webinstall for k8s by sean.lee (2022.07~)  

# Work-ubuntu starter pack ( All in One )
```bash
curl -sS https://raw.githubusercontent.com/netios/automation-world/main/k8s/ps_zsh.sh | bash

# chsh -s /usr/bin/zsh
# sudo useradd -m -s /bin/bash <username> # hd
# sudo usermod -aG sudo <username> # hd
```

## zsh
```bash
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -ri "s/(^ZSH_THEME=).*/\1jonathan/g" ~/.zshrc
```

---

## rsync
```bash
sudo cat "127.0.0.1 MYHOST" >> /etc/hosts
curl -v telnet://) telnet [MYHOST]:873
rsync -avz [MYHOST]::[LOCAL_DIR] [REMOTE_SOURCE_DIR]
```
---

## column , jq , fzf , bat ( Essential utility )
```bash
sudo apt install -y bsdmainutils
sudo apt install -y unzip
sudo apt install -y jq
sudo apt install -y ipcalc
sudo apt install -y fzf
sudo apt install -y tree
sudo apt install -y screen
sudo apt install -y duf
sudo apt install -y bat
ln -s /usr/bin/batcat ~/bin/bat 
# ~/.zshrc 
# For Dark Background
echo "export FZF_DEFAULT_OPTS=\"--preview 'bat --theme 1337 --color=always {}'\"" >> ~/.zshrc
# For Bright Background
echo "export FZF_DEFAULT_OPTS=\"--preview 'bat --theme GitHub --color=always {}'\"" >> ~/.zshrc
source ~/.zshrc 

# delta ( diff )
xh -d "$(curl -s -L "https://github.com/dandavison/delta/releases/latest" | grep -oP '(?<=tag/)[\d.]+' | head -1 | xargs -I {} echo "https://github.com/dandavison/delta/releases/download/{}/git-delta_{}_amd64.deb")"
sudo dpkg -i $(echo $(curl -s -L "https://github.com/dandavison/delta/releases/latest" | grep -oP '(?<=tag/)[\d.]+' | head -1 | xargs -I {} echo "https://github.com/dandavison/delta/releases/download/{}/git-delta_{}_amd64.deb") | xargs basename)

# ~/.gitconfig
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

```

## glow
```bash
# Debian/Ubuntu
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install glow
```

## xh ( new curl )
```bash
curl -sfL https://raw.githubusercontent.com/ducaale/xh/master/install.sh | sh
```

## awscli v2
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
sudo ./aws/install --update
```
## awslogs
```bash
sudo apt-get install python3-pip -y
sudo pip3 install awslogs
```

## kubectl
```bash
# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
sudo apt-get install kubectl
```

## kubecolor  
```bash
curl -sS https://raw.githubusercontent.com/netios/automation-world/main/k8s/kubecolor_install.sh | bash
```

## Helm3 ( ubuntu )
```bash
sudo snap install helm --classic
```

## opentofu ( ubuntu )
```bash
sudo snap install opentofu --classic
```

## terraform
```bash
curl -sS https://raw.githubusercontent.com/netios/automation-world/main/k8s/terraform_helm_init.sh | bash
```

## k9s
```bash
curl -sS https://webinstall.dev/k9s | bash
```


