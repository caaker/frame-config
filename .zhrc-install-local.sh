# soft links config files with force to the home directory in your local machine
# update later for cloud based development
lConfig() {

  # shell config
  ln -sf ~/top/frame-config/.zshrc.sh                   ~/.zshrc

  # git config
  ln -sf ~/top/frame-config/install/.gitconfig          ~/.gitconfig
  ln -sf ~/top/frame-config/install/.gitignore          ~/.gitignore

  # global tool config
  ln -sf ~/top/frame-config/install/.eslintrc           ~/.eslintrc
  ln -sf ~/top/frame-config/install/nodemon.json        ~/nodemon.json
  
  # done
  echo "config files installed successfully"
}