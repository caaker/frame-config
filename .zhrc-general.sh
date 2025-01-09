#
# PS1 is used to configure the cursor to display the path
#

PS1="< %d > "

#
# General Functions
#

# search home directory for all files of input type
findAll() {
  sudo find ~ -name "*.$1"
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

f-t() {
  cd "$HOME/top"
  li
}

f-c() {
  cd "$HOME/top/frame-config"
  reload
}

f-a() {
  cd "$HOME/top/frame-arc"
  reload
}

f-cl() {
  cd "$HOME/top/frame-client"
  reload
}

f-s() {
  cd "$HOME/top/frame-server"
  reload
}

f-p() {
  cd "$HOME/top/private"
  reload
}

f-l() {
  cd "$HOME/top/learn"
  reload
}
