#
# GLOBAL INSTALLS
#

iZSH() {
  sudo apt update
  sudo apt install -y zsh
  chsh -s $(which zsh)
  echo "< message > Zsh installed and set as default shell < message >"
}

iGit() {
  sudo apt update
  sudo apt install -y git
  echo "< message > Git installed. < message >"
}

iNode() {
  sudo apt update
  sudo apt install nodejs npm
  echo "< message > nodejs, npm installed < message > "
}

iGlobal() {
  sudo npm i -g nodemon
  sudo npm i -g eslint
  echo "< message > nodemon, eslint installed globally < message > "
}