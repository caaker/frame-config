#
# SSH Configurations and Connections
#


# Local Machine to AWS EC2 instance connection via SSH
connectEC2() {
  # AWS Box
  #  Fire up an EC2 instance  
 	#  Allow traffic for HTTP, HTTPS, and SSH.
 	#  Generate an SSH key pair and save for remote connections
  #    In this case AWS generates a .pem file	
  # Local Box 
  #   Make .ssh folder in home and add the .pem file which is a private key there
  #   Finally run the command below to connect to the AWS instance
  ssh -i ~/.ssh/aws.pem ubuntu@ec2-3-23-103-0.us-east-2.compute.amazonaws.com
}


# most linux systems come with bash by default
# use this to install zshell
setupZSH() {
  sudo apt update
  sudo apt install zsh
  echo -e "< message> ZSH setup with version: $(zsh --version)\n"
  # make default shell
 	# chsh -s $(which zsh)
  # or edit etc/passwd directly
}


# AWS or similar to Github configuration for SSH
setupGitSSH() {
  # place your private key in ~/.ssh
  # creates a config file in ~/.ssh via the command below
  echo "Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/rsa4096-github
  IdentitiesOnly yes" >> ~/.ssh/config
  # setup permissions to read and write for the owner only
  chmod 600 ~/.ssh/config
  # done - git commands should now work via the ssh protocol.
  echo "< message > SSH config updated and permissions set."
}


# these repos are currently needed for my domain
cloneRepos() {
  # install manually
  # git clone git@github.com:caaker/frame-config.git
  git clone git@github.com:caaker/frame-client.git
  git clone git@github.com:caaker/frame-server.git
  git clone git@github.com:caaker/frame-arc.git
}


#
# Start
#


start() {

  #
  # Load Files
  #

  # installs config files
  source "$HOME/top/frame-config/.zhrc-install.sh"

  # common zsh commands simplified - rc, li, etc.
  source "$HOME/top/frame-config/.zhrc-general.sh"

  # common git commands simplified - gs, etc.
  source "$HOME/top/frame-config/.zhrc-git.sh"

  rc
  echo "****************************************************************************************************"
  echo "User:     $USER"
  echo "Time:     $(date +"%T")"
  echo "Start:    connectEC2, setupZSH, setupGitSSH, cloneRepos"
  echo "Install:  lConfig, iNode, iGlobal, iClient, iServer"
  echo "Git:      gs, ga, gc, gpullom, gpushom, gl, gcl"
  echo "****************************************************************************************************"
  cd "$HOME/top/frame-config"

}

# this runs this file - convenience method
run() {
  source "$HOME/top/frame-config/.zshrc.sh"
}


# ****************************************************************************************************
start
# ****************************************************************************************************


# populate and add these later
  # on hold
  # source "$HOME/top/frame-config/.zhrc-ut-classes.sh"
  # source "$HOME/top/frame-config/.zhrc-network.sh"
  # source "$HOME/top/frame-config/.zhrc-macos.sh"
  # source "$HOME/top/frame-config/.zhrc-test.sh"
  # source "$HOME/top/frame-config/.zhrc-wsl.sh"
  # source "$HOME/top/frame-config/.private.sh"
