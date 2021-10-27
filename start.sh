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
#sudo apt-get -y install curl git
