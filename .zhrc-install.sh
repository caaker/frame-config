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

# install nodejs and npm
iNode() {
  sudo apt update
  sudo apt install nodejs npm
  echo "< message > nodejs, npm installed globally < message > "
}

# install global npm packages - nodemon, eslint
iGlobal() {
  sudo npm i -g nodemon
  sudo npm i -g eslint
  echo "< message > nodemon, eslint installed globally < message > "
}


#
# LINK CONFIG FILES
#


# soft links config files with force to the home directory ~
lConfig() {
  ln -sf ~/top/frame-config/.zshrc.sh                   ~/.zshrc
  ln -sf ~/top/frame-config/install/.eslintrc           ~/.eslintrc
  ln -sf ~/top/frame-config/install/.gitconfig          ~/.gitconfig
  ln -sf ~/top/frame-config/install/.gitignore          ~/.gitignore
  ln -sf ~/top/frame-config/install/nodemon.json        ~/nodemon.json
  echo "< message > .zshrc.sh, .eslintrc, .gitconfig, .gitignore, nodemon.json soft linked into home directory < message > "
}

# for Linux with build 4200, this is the correct path
lSublime() {
  ln -sf ~/top/frame-config/install/Preferences.sublime-settings ~/.config/sublime-text/Packages/User/Preferences.sublime-settings
  echo "< message > sublime config file soft linked < message > "
}


#
# LOCAL INSTALLS
#


# install client side npm packages used for development -D, and production
iClient() {

  # testing library
  npm i -D jest

  # use of webpack from the command line requires both modules
  npm i -D webpack webpack-cli

  # integrates babel with webpack, preset-env allows modern JS, preset-react allows JSX/React
  npm i -D babel-loader @babel/preset-env @babel/preset-react

  # css-loader reads the files, while style-loader injects them into the page, both are required for CSS use
  npm i -D style-loader css-loader

  # both modules are required to use typescript
  npm i -D ts-loader typescript

  # install types used by typescript
  npm i -D @types/react @types/react-dom @types/react-redux

  # production libraries
  npm i react react-dom redux react-redux frame-arc
  echo "< message > Client-side production and development packages installed < message >" 
}

# install server side npm packages
iServer() {
  npm i express express-session cookie-parser
  npm i mongoose
  npm i passport passport-google-oauth
  npm i ws
  echo "< message > Server-side production packages installed < message >"
}