#
#
# Install Configuration Files
#
#

# links config files with force
lConfig() {

  # home directory configuration files
  ln -f .zshrc.sh              ~/.zshrc
  ln -f ./install/.eslintrc    ~/.eslintrc
  ln -f ./install/.gitconfig   ~/.gitconfig
  ln -f ./install/.gitignore   ~/.gitignore
  ln -f ./install/nodemon.json ~/nodemon.json
  echo "< message > .zshrs.sh, .eslintrc, .gitconfig, .gitignore, nodemon.json linked into home directory < message > "

  # etc configuration files
  # sudo ln -f ./install/mongod.conf  /usr/local/etc/mongod.conf
  # echo "< message > mongod.conf linked into usr/local/etc < message > "
}


#
#
# Install node, npm, and npm packages
#
#


# install global npm packages - perhaps move these to below
iGlobal() {
  # sudo npm i -g npm
  sudo npm i -g nodemon
  sudo npm i -g eslint

  # done
  echo "< message > nodemon, eslint installed globally < message > "
}

iClient() {

  # install client side npm packages used for development -D
  # using -g global option will no create a package.json file
  sudo npm i -D webpack webpack-cli
  sudo npm i -D babel-loader @babel/preset-env @babel/preset-react
  sudo npm i -D style-loader css-loader

  #install client side npm packages used for production
  sudo npm i react react-dom redux react-redux frame-arc

  # done
  echo "< message > Client-side production and development packages installed globally" 
}

# install server side npm packages
iServer() {
  sudo npm i -g express express-session
  sudo npm i -g mongoose
  sudo npm i -g passport passport-google-oauth

  # done
  echo "< message > Server-side production packages installed globally"
}
