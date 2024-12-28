#
# Connect to EC2 using -i
#


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


#
# Configure Github using config file
#


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


#
# Clone Repos for App - move frame-arc to NPM server
#


cloneRepos() {
  # git clone git@github.com:caaker/frame-config.git # initial might be renamed to frame-boot
  git clone git@github.com:caaker/frame-client.git
  git clone git@github.com:caaker/frame-server.git
  git clone git@github.com:caaker/frame-arc.git
}
