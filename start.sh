log_file=~/install_dotfiles_progress.log

echo "begin dotfiles" >> $log_file

#add some repositories
sudo add-apt-repository ppa:gnome-terminator -y
# upgrade
sudo apt-get update && sudo apt-get upgrade -y
echo "apt upgrade" >> $log_file

# install git
sudo apt-get install git -y
if type -p git > /dev/null; then
	echo "git installed" >> $log_file
else
	echo "Error: git not installed" >> $log_file
fi

# TODO: clone .dotfiles

#====
# install section
#====

# command line
# zsh
sudo apt-get -y install zsh
sudo apt-get -y install zsh-syntax-highlighting
echo "zsh done" >> $log_file

#terminator (needs extra repository)
sudo apt-get -y install terminator
echo "terminator done" >> $log_file

#IDE
#IntelliJ look for practice way to doit (jetbrains-toolbox-intstall git hub)
sudo snap install intellij-idea-ultimate --classic
echo "intellij done" >> $log_file

#VScode
#check how to install (not necessary for the moment)

#asdf - needs homebrew

#aws cli v2
# TODO: check who to run it for 2nd time without intervention
sudo apt-get -y install curl
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install -y

#spectre
#sudo apt-get -y install python-software-properties
sudo apt-get -y install python3-pip
sudo apt-get -y install python3-virtualenv
#virtualenv --version
mkdir sceptre-python-env
cd sceptre-phyton-env
virtualenv ven
source venv/bin/activate
pip install sceptre
cd ..

#java
#sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
#sdk version

#node
sudo apt-get -y install nodejs
#node -version

sudo apt-get -y install npm
#npm -v

#yarn
sudo npm install --global yarn
# yarn --version

#nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

#typscript
sudo npm install typescript -g

#lambdas
#serverless framework
sudo npm install -g serveless
# serverless --version

#sam cli
curl https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
unzip aws-sam-cli-linux-x86_64.zip -d sam-installation
sudo ./sam-installation/install
#sam --version

#docker
#docker-ce

#options

#sudo yum update -y
#sudo amazon-linux-extras install docker

#or
# remo oldversions
#sudo apt-get remove docker docker-engine docker.io containerd runc

#sudo apt-get install \
#    ca-certificates \
#    curl \
#    gnupg \
#    lsb-release
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
#sudo apt-get -y install docker-ce docker-ce-cli containerd.io

#sudo service docker start
#sudo usermod -a -G docker ec2-user
#docker ps

#kubernetes
#kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
#kubectl version --client

#kubectx ( alt kubie )
kubectl krew install ctx
kubectl krew install ns

#octant ( alt kubelens )
curl https://github.com/vmware-tanzu/octant/releases/download/v0.24.0/octant_0.24.0_Linux-64bit.deb
dpkg -i octant_0.24.0_Linux-64bit.deb

#kubeseal
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.16.0/kubeseal-linux-amd64 -O kubeseal
sudo install -m 755 kubeseal /usr/local/bin/kubeseal

#minikube k3s kind
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

#helm
sudo snap install helm --classic

#fluxctl
sudo snap install fluxctl --classic

#istioctl
# TODO: pending 

#kafka
#kafkactl
sudo snap install kafkactl

#db
#psql
#sudo apt-get install postgresql-12
sudo apt update
sudo apt install postgresql postgresql-contrib

#DBaever
sudo apt -y install default-jdk
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt update
sudo apt install dbeaver-ce
