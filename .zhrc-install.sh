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
  sudo npm i -g nodemon
  sudo npm i -g eslint
  echo "< message > nodemon, eslint installed globally < message > "
}

# install client side npm packages used for development -D
iClient() {

  # test library
  npm i -D jest

  # bundler and its dependencies
  npm i -D webpack webpack-cli
  npm i -D babel-loader @babel/preset-env @babel/preset-react
  npm i -D style-loader css-loader

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