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
#sam cli

#docker
#docker-ce

#kubernetes
#kubectl
#kubectx kubi
#octant kubelens
#kubeseal
#minikube k3s kind
#helm
#flixctl
#istioctl

#kafka
#kafkactl

#db
#psql
#DBaever
