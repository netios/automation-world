### webinstall for k8s by sean.lee (2022.07~)  
## column , jq ( Essential utility )
```bash
sudo apt-get install bsdmainutils
sudo apt install -y jq
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

## terraform
```bash
curl -sS https://raw.githubusercontent.com/netios/automation-world/main/k8s/terraform_helm_init.sh | bash
```

## zsh
```bash
sudo apt install zsh
curl -sS https://raw.githubusercontent.com/netios/automation-world/main/k8s/ps_zsh.sh | bash
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
