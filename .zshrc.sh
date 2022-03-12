
# test syntax here
test() {
  # echo "argument0: $0";
  # echo "argument1: $1";
}

#
#
#
#
# process.env variables
#
#
#
#

source "$HOME/top/_private/_p.sh"
# printenv

#
#
#
#
# Configure
#
#
#
#

my_path="/top"

#
#
#
#
# Run commands
#
#
#
#

echo "Hello, $USER.  You are using $0.  The time is $(date +"%T"). Your favorite color is blue." 
my_root="$HOME$my_path"
cd "$my_root"

#
#
#
#
# Functions
#
#
#
#

top() {
  cd /Users/c/top/
}

#
#
#
#
# runApp
# - depends upon 'npm run server' and 'npm run client' two scripts in package.json
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

#
#
#
#
# Aliases - move to functions
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
# PS1
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

# list global pakcages
lg() {
  npm ls -g --depth 0
}

# heroku log
hl() {
  heroku logs --tail
}

#
#
#
#
# Network Functions
#
#
#
#

# shows the mac address
mac() {
  ifconfig en0 | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'
}

# shows the ip address
ip() {
  ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}'
}

# randomize the mac address
randomizeMac() {
  local mac=$(macCreate)
  sudo ifconfig en0 ether $mac
  sudo ifconfig en0 down
  sudo ifconfig en0 up
  echo "randomizeMac complete with new mac address: $mac"
}

macCreate(){
  printf '00:60:2f:%02x:%02x:%02x\n' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256]
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

# automate git push to heroku with optional comment
gph() {
  git add .
  git commit -m $1
  git push heroku main
}

# git add
ga() {
  git add .
}

# git commit
gc() {
  git commit -m $1
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

gsi() {
  git status --ignored
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


# global like your mom
installGlobal() {
  npm install -g npm
  npm install -g nodemon
  npm install -g eslint
}

#install client repo
installClient() {
  npm install react react-dom react-redux
  npm install --save-dev webpack webpack-cli 
  npm install --save-dev babel-loader @babel/preset-env @babel/preset-react
  npm install --save-dev style-loader css-loader

  # optional
  # npm npm install @mui/icons-material @emotion/react @emotion/styled
}

# install server repo
installServer() {
  npm install express express-session 
  npm install redis connect-redis
  npm install mongoose
  npm install passport passport-google-oauth
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

  # oddly specefic
  ln -f Preferences.sublime-settings "/Users/c/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
}
