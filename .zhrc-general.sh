#
#
# PS1 is used to configure the cursor to display the path
#
#

PS1="< %d > "

#
#
# General Functions
#
#


# shows the hardware architecture and likely word size
architecture() {
  uname -m
  #x86_64 for a 64 bit x86 CPU
}

# printenv to see environment variables
pe() {
  printenv
}

# grep processes for node not including grep process via [n]
gpn() {
  ps aux | grep '[n]ode'
}

# history
h() {
  history
}

# real clear, replaces clear
rc() {
  # clear
  printf '\33c\e[3J'
}

# list
li() {
  rc
  ls -al
}

# list global packages, node installs npm and corepack globally currently
lg() {
  npm ls -g --depth 0
}


#
# Convenience functions for moving between repos
#

f-b() {
  cd ~/top/frame-build
}

f-ca() {
  cd ~/top/caaker.github.io
}

f-a() {
  cd ~/top/frame-arc
}

f-cl() {
  cd ~/top/frame-client
}

f-c() {
  cd ~/top/frame-config
}

f-s() {
  cd ~/top/frame-server
}

f-l() {
  cd ~/top/learn
}

f-p() {
  cd ~/top/private
}

