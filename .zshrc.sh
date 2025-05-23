
#####################################################################################################
#  NOTES
#
#  To begin run this file using the source command - source .zshrc.sh
#  It will run the other .sh files below as well as they are sourced
#  reload() accomplishes this progrmatically
#  reload() will reload and start this file, while start() will simply run it
#
####################################################################################################



#
# start - this acts as an immediately invoked function
#


start() {


  #
  # Reload this file
  #


  # this runs this file, avoids the need to open a new shell when it changes, it is a convenience method
  reload() {
    source "$HOME/top/frame-config/.zshrc.sh"
  }


  #
  # Install zshell
  #


  installZSH() {
    sudo apt update
    sudo apt install zsh
    echo -e "< message> ZSH setup with version: $(zsh --version)\n"
    # make default shell using the command below or edit the etc/passwd directly
    # chsh -s $(which zsh)
  }


  #
  # Run .sh files
  #


  # make common commands accessible
  source "$HOME/top/frame-config/.zhrc-general.sh"

  # make common git commands accessible
  source "$HOME/top/frame-config/.zhrc-git.sh"

  # make install script accessible
  source "$HOME/top/frame-config/.zhrc-install.sh"

  #
  source "$HOME/top/frame-config/.zhrc-learn.sh"

  #
  source "$HOME/top/frame-config/.zhrc-macos.sh"

  #
  source "$HOME/top/frame-config/.zhrc-network.sh"

  #
  source "$HOME/top/frame-config/.zhrc-private.sh"

  # make these scripts accessible
  source "$HOME/top/frame-config/.zhrc-repos.sh"

  #
  source "$HOME/top/frame-config/.zhrc-test.sh"

  #
  # Output to the current shell
  #

  rc
  ip
  echo "****************************************************************************************************"
  echo "User:       $USER"
  echo "Time:       $(date +"%T")"
  echo "Start:      connectEC2, setupZSH, setupGitSSH, cloneRepos"
  echo "Install:    lConfig, iGlobal, iClient, iServer"
  echo "Git:        gs, gd, ga, gc, gr, gt, gpush, gpull"
  echo "General:    gpush, gpull, updateCache, deploy, gdeploy"
  echo "****************************************************************************************************"

}


# ****************************************************************************************************
start
# ****************************************************************************************************
