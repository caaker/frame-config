#
#
# macos
#
#

# shows hidden files and folders such as .git
configMACOS() {
  defaults write com.apple.finder AppleShowAllFiles YES
  killall Finder
}

# opens a tab for the server and runs it, opens a tab for the client and runs it
runFrame() {
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
  tell application "Terminal" to do script "cd frame-client" in front window
  tell application "Terminal" to do script "npm run client-dev" in front window
  EOF
}
