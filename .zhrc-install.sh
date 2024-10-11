#
#
# Install Configuration Files
#
#

# links config files with force
lConfig() {

  # home directory
  ln -f .zshrc.sh              ~/.zshrc
  ln -f ./install/.eslintrc    ~/.eslintrc
  ln -f ./install/.gitconfig   ~/.gitconfig
  ln -f ./install/.gitignore   ~/.gitignore
  ln -f ./install/nodemon.json ~/nodemon.json

  # home directory configuration files
  echo "< message > .zshrs.sh, .eslintrc, .gitconfig, .gitignore, nodemon.json linked into home directory ~"

  # usr/local/etc/
  # requires sudo unlike home directory access
  sudo ln -f ./install/mongod.conf  /usr/local/etc/mongod.conf

  # etc configuration files
  echo "< message > mongod.conf, redis.conf linked into usr/local/etc"

  # oddly specific
  # ln -f ./install/Preferences.sublime-settings "/Users/c/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
}


#
#
# Install node, npm, and npm packages
#
#

# install node and npm
iNode() {
  # Install node LTS ( Long Term Support )
  # Update package index, install NodeSource PPA, install Node.js, verify
  sudo apt update
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt install -y nodejs

  # done
  echo "< message > Node version $(node -v) and npm version $(npm -v) have been installed."
}

# install global npm packages - perhaps move these to below
iGlobal() {
  # sudo npm i -g npm
  sudo npm i -g nodemon
  sudo npm i -g eslint

  # done
  echo "< message > nodemon, eslint installed globally"
}

iClient() {

  #install client side npm packages used for development -D
  sudo npm i -g -D webpack webpack-cli
  sudo npm i -g -D babel-loader @babel/preset-env @babel/preset-react
  sudo npm i -g -D style-loader css-loader

  #install client side npm packages used for production
  sudo npm i -g react react-dom react-redux

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
