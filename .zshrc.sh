
#
#
#
#
# Test Area
#
#
#
#

inner() {
  echo "inner"
}

# arguments are built in as $0, $1, ...
test() {
  echo "argument 0: $0"
  echo "argument 1: $1"
  inner
}

#
#
#
#
# Private
#
#
#
#

source "$HOME/top/_private/_p.sh"
# printenv # to see environment variables

#
#
#
#
# Network Functions
#
#
#
#

# shows the ip address
ip() {
  ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}'
}

# https://superuser.com/questions/86956/release-renew-ip-address-via-terminal-in-os-x
rip() {
  sudo ipconfig set en0 BOOTP
  sudo ipconfig set en0 DHCP
}

# shows the mac address
mac() {
  ifconfig en0 | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'
}

macCreate(){
  printf '00:60:2f:%02x:%02x:%02x\n' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256]
}

# randomize the mac address
randomizeMac() {
  local mac=$(macCreate)
  sudo ifconfig en0 ether $mac
  sudo ifconfig en0 down
  sudo ifconfig en0 up
  echo "randomizeMac complete with new mac address: $mac"
}

#
#
#
#
# Run
#
#
#
#

#echo "User:  $USER"
#echo "Shell: $0"
echo ""
#echo "Time:  $(date +"%T")"
echo "MAC:   $(mac)"
echo "IP:    $(ip)"
echo ""
cd "$HOME/top"

#
#
#
#
# PS1 is used to configure the cursor
#
#
#
#

# set up cursor to display path
PS1="< %d > "

#
#
#
#
# Aliases - consider making functions for malleability
#
#
#
#

alias h='history'
alias g='git'
alias p='ps aux | grep node'

#
#
#
#
# Quick Functions
#
#
#
#

# real clear
rc() {
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

# heroku log
hl() {
  heroku logs --tail
}

top() {
  cd /Users/c/top/
}

#
#
#
#
# Git Functions
#
#
#
#

# automate git push to heroku
gph() {
  git add .
  git commit -m "auto-push"
  git push heroku main
}

# git add
ga() {
  git add .
}

# git commit
gc() {
  git commit -m "$1"
}

# git log
gl() {
  git shortlog -s
}

# git push
gp() {
  git push github main
}

# git remote
gr() {
  git remote -v
}

# git status
gs() {
  git status
}

# git test
gt() {
  ssh -T github
}

#
#
#
#
# More
#
#
#
#

# shows hidden files in macOS finder
setupOS() {
  defaults write com.apple.finder AppleShowAllFiles YES
}


# install global
installGlobal() {
  npm i -g npm
  npm i -g nodemon
  npm i -g eslint
}

#install client side
installClient() {
  npm i -D webpack webpack-cli
  npm i -D babel-loader @babel/preset-env @babel/preset-react
  npm i -D style-loader css-loader

  npm install react react-dom react-redux
  # optional
  # npm install @mui/icons-material @emotion/react @emotion/styled
}

# install server side
installServer() {
  npm i express express-session
  npm i redis connect-redis
  npm i mongoose
  npm i passport passport-google-oauth
}

# install config files
installConfig() {

  # home directory
  ln -f .zshrc.sh    ~/.zshrc
  ln -f .eslintrc    ~/.eslintrc
  ln -f .gitconfig   ~/.gitconfig
  ln -f .gitignore   ~/.gitignore
  ln -f nodemon.json ~/nodemon.json

  # usr/local/etc/
  ln -f mongod.conf  /usr/local/etc/mongod.conf
  ln -f redis.conf   /usr/local/etc/redis.conf

  # oddly specific
  ln -f Preferences.sublime-settings "/Users/c/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
}

#
#
#
#
# runApp locally
#
#
#
#

run() {
osascript <<EOF
tell application "System Events"
  tell process "Terminal" to keystroke "t" using command down
end tell
tell application "Terminal" to do script "cd frame-server" in front window
tell application "Terminal" to do script "npm run server" in front window
EOF
osascript <<EOF
tell application "System Events"
  tell process "Terminal" to keystroke "t" using command down
end tell
tell application "Terminal" to do script "cd frame" in front window
tell application "Terminal" to do script "npm run client" in front window
EOF
}
