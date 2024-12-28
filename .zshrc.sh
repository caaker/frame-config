
####################################################################
#
#  To begin run this file using the source command
#
#  source .zshrc.sh
#
#  It will run the other .sh files as well
#
####################################################################


#
# start - this acts as an immediately invoked function, if this file changes use reload() to reload it via source command
#


start() {

  #
  # Install zshell
  #


  installZSH() {
    sudo apt update
    sudo apt install zsh
    echo -e "< message> ZSH setup with version: $(zsh --version)\n"
    # make default shell
    # chsh -s $(which zsh)
    # or edit etc/passwd directly
  }


  #
  # Run .sh files
  #


  # runs externally generated code
  source "$HOME/top/frame-config/.zhrc-generated.sh"

  # mae connect scripts accessible
  source "$HOME/top/frame-config/.zhrc-repos.sh"

  # make install script accessible
  source "$HOME/top/frame-config/.zhrc-install.sh"

  # make common commands accessible
  source "$HOME/top/frame-config/.zhrc-general.sh"

  # make common git commands accessible
  source "$HOME/top/frame-config/.zhrc-git.sh"


  #
  # Output to the current shell
  #


  rc
  echo "****************************************************************************************************"
  echo "User:     $USER"
  echo "Time:     $(date +"%T")"
  echo "Start:    connectEC2, setupZSH, setupGitSSH, cloneRepos"
  echo "Install:  lConfig, iGlobal, iClient, iServer"
  echo "Git:      gs, ga, gc, gpullom, gpushom, gl, gcl"
  echo "****************************************************************************************************"
  cd "$HOME/top/frame-config"

}

# this runs this file, avoids the need to open a new shell when it changes, it is a convenience method
reload() {
  source "$HOME/top/frame-config/.zshrc.sh"
}


# ****************************************************************************************************
start
# ****************************************************************************************************
