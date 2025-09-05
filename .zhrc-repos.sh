#
# Start
#

# Clone this repo first using command below
#   git clone git@github.com:caaker/frame-config.git

#
# Configure Github ssh
#

# eventualy delete this and simply copy the config file from the repo to the local machine
setupGitSSH() {
  # place your private key in ~/.ssh
  # creates a config file in ~/.ssh via the command below or enter manually
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
# Connect to EC2 using ssh -i, update this later to use a config file as above
#

# eventualy delete this and create a config file
connectEC2() {
  # AWS Box
  #  Fire up an EC2 instance  
 	#  Allow traffic for HTTP, HTTPS, and SSH.
 	#  Generate an SSH key pair and save for remote connections
  #    In this case AWS generates a .pem file	
  # Local Box 
  #   Make .ssh folder in home and add the .pem file which is a private key there
  #   Finally run the commands below to connect to the AWS instance
  ec2_string="ubuntu@ec2-3-23-103-0.us-east-2.compute.amazonaws.com"
  ssh -i ~/.ssh/aws.pem $ec2_string
}