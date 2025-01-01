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

# populate to reset the ip address
rip() {
}