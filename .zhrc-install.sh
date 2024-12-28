#
# Link Configuration Files
#

# links config files with force -f to the home directory ~
lConfig() {
  ln -f .zshrc.sh              ~/.zshrc
  ln -f ./install/.eslintrc    ~/.eslintrc
  ln -f ./install/.gitconfig   ~/.gitconfig
  ln -f ./install/.gitignore   ~/.gitignore
  ln -f ./install/nodemon.json ~/nodemon.json
  echo "< message > .zshrs.sh, .eslintrc, .gitconfig, .gitignore, nodemon.json linked into home directory < message > "
}

# link Mongo later
lMongo() {
  # sudo ln -f ./install/mongod.conf  /usr/local/etc/mongod.conf  
  # echo "< message > mongod.conf linked into usr/local/etc < message > "
}

#
# NPM Install Commands
#

# install global npm packages
iGlobal() {
  # sudo npm i -g npm
  sudo npm i -g nodemon
  sudo npm i -g eslint
  echo "< message > nodemon, eslint installed globally < message > "
}

# install client side npm packages used for development -D
iClient() {
  sudo npm i -D webpack webpack-cli
  sudo npm i -D babel-loader @babel/preset-env @babel/preset-react
  sudo npm i -D style-loader css-loader
  sudo npm i react react-dom redux react-redux frame-arc
  echo "< message > Client-side production and development packages installed < message >" 
}

# install server side npm packages
iServer() {
  sudo npm i express express-session
  sudo npm i mongoose
  sudo npm i passport passport-google-oauth
  echo "< message > Server-side production packages installed < message >"
}