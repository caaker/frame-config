
#####################################################################################################
#  NOTES
#
#  To begin run this file using "source .zshrc.sh".  
#  It will run the other .sh files below as well.
# 
####################################################################################################

#
# start
#

start() {

  #
  # Reload this file
  #

  reload() {
    source "$HOME/top/frame-config/.zshrc.sh"
  }

  #
  # Source config files
  #

  source_configs() {
    source "$HOME/top/frame-config/.zhrc-general.sh"
    source "$HOME/top/frame-config/.zhrc-git.sh"
    source "$HOME/top/frame-config/.zhrc-install.sh"
    source "$HOME/top/frame-config/.zhrc-learn.sh"
    source "$HOME/top/frame-config/.zhrc-macos.sh"
    source "$HOME/top/frame-config/.zhrc-network.sh"
    source "$HOME/top/frame-config/.zhrc-repos.sh"
    source "$HOME/top/frame-config/.zhrc-test.sh"
  }
  source_configs

  #
  # Output to the current shell
  #

  rc
  echo "****************************************************************************************************"
  echo "User:       $USER"
  echo "Time:       $(date +"%T")"
  echo "Git:        gs, gd, ga, gc, gr, gt, gpush, gpull"
  echo "****************************************************************************************************"
}

# ****************************************************************************************************
start
# ****************************************************************************************************
