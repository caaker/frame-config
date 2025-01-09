#
#
# Network Functions
#
#

# display both local and public ip address
ip() {
  echo ""
  echo "ip-local:  $(ipconfig getifaddr en0)"
  echo "ip-public: $(curl -s ifconfig.me)"
  echo ""
}

# reset the ip address
# verify correct interface with ifconfig
rip() {
  sudo ifconfig en0 down
  sudo ifconfig en0 up
}