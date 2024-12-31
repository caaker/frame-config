#
# PS1 is used to configure the cursor to display the path
#

PS1="< %d > "

#
# General Functions
#

# note that macOS has removed SIP while in recover mode to make this work
findAll() {
  sudo find / -name "*.sublime-build"
}

# printenv to see environment variables
pe() {
  printenv
}

# grep processes for node
pn() {
  ps aux | grep node
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

# list global packages
lg() {
  npm ls -g --depth 0
}

t() {
  cd /Users/c/top/
  li
}


#
# Convenience functions for moving between repos
#


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
