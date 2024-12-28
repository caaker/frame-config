#
#
# Test Area
#
#

test() {
  echo "test"
}

# argument $0 is the function name
# arguments are built in as $1, $2, ...
test1() {
  echo "argument 0: $0"
  echo "argument 1: $1"
  echo "argument 2: $2"
}
