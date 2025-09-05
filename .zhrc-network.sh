#
#
# Network Functions
#
#

# display the public address using ifconfig.me
ip() {
  echo ""
  echo "ip-public: $(curl -s ifconfig.me)"
  echo ""
}
