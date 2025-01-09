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
test-1() {
  echo "argument 0: $0"
  echo "argument 1: $1"
  echo "argument 2: $2"
}

# npm update - for reliability, clear the cache, or the command will not always work
nu() {
  npm cache clean --force
  npm install frame-arc@latest  
}

countFiles() {
  find . -type f | wc -l
}


