### webinstall for k8s by sean.lee (2022.07~)  
## column , jq , fzf , bat ( Essential utility )
```bash
sudo apt install -y bsdmainutils
sudo apt install -y jq
sudo apt install -y ipcalc
sudo apt install -y fzf
sudo apt install -y tree
sudo apt install -y duf
sudo apt install -y bat
ln -s /usr/bin/batcat ~/.local/bin/bat 
# ~/.zshrc 
# For Dark Background
echo "export FZF_DEFAULT_OPTS=\"--preview 'bat --theme 1337 --color=always {}'\"" >> ~/.zshrc
# For Bright Background
echo "export FZF_DEFAULT_OPTS=\"--preview 'bat --theme GitHub --color=always {}'\"" >> ~/.zshrc
source ~/.zshrc 

# delta ( diff )
xh -d https://github.com/dandavison/delta/releases/download/0.16.5/git-delta-musl_0.16.5_amd64.deb
sudo dpkg -i git-delta-musl_0.16.5_amd64.deb
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

## xh ( new curl )
```bash
curl -sfL https://raw.githubusercontent.com/ducaale/xh/master/install.sh | sh
```

## kubectl
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
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

## zsh
```bash
sudo apt install zsh
curl -sS https://raw.githubusercontent.com/netios/automation-world/main/k8s/ps_zsh.sh | bash
chsh -s /usr/bin/zsh
# sudo useradd -m -s /bin/bash <username> # hd
# sudo usermod -aG sudo <username> # hd
```

## k9s
```bash
curl -sS https://webinstall.dev/k9s | bash
```

## rsync
```bash
sudo cat "127.0.0.1 MYHOST" >> /etc/hosts
curl -v telnet://) telnet [MYHOST]:873
rsync -avz [MYHOST]::[LOCAL_DIR] [REMOTE_SOURCE_DIR]
```
## awscli v2
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```
