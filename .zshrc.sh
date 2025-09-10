
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
    source ~/top/frame-config/.zshrc.sh
  }
  alias r='reload'

  #
  # Source config files
  #

  source_configs() {

    source ~/top/frame-config/.zhrc-general.sh
    source ~/top/frame-config/.zhrc-git.sh
    source ~/top/frame-config/.zhrc-github.sh
    source ~/top/frame-config/.zhrc-install.sh
    source ~/top/frame-config/.zhrc-learn.sh
    source ~/top/frame-config/.zhrc-macos.sh
    source ~/top/frame-config/.zhrc-network.sh
    source ~/top/frame-config/.zhrc-repos.sh
    source ~/top/frame-config/.zhrc-test.sh

    source ~/top/private/gen-crypto/.zshrc-priv.sh
  }

  source_configs

  #
  # Output to the current shell
  #

  rc
  echo "****************************************************************************************************"
  echo "User:       $USER"
  echo "Time:       $(date +"%T")"
  echo "Notes:      ssh agent starting"

  # make sure to setup ssh public and private keys
  startSSH() {
    eval "$(ssh-agent -s)" > /dev/null 2>&1
    ssh-add ~/.ssh/rsa4096-github > /dev/null 2>&1
  }
  startSSH
  echo "****************************************************************************************************"

}

# ****************************************************************************************************
start
# ****************************************************************************************************
