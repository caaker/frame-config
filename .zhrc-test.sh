#
#
# Test Area
#
#

# argument $0 is the function name
# arguments are built in as $1, $2, ...
test() {
  echo "argument 0: $0"
  echo "argument 1: $1"
  echo "argument 2: $2"
}

# show all files in the current directory excluding files in the .git and node_modules folder
showFiles() {
  find . -type f ! -path "./.git/*" ! -path "./node_modules/*"
}

# count all files in the current directory excluding files in the .git and node_modules folder
countFiles() {
  find . -type f ! -path "./.git/*" ! -path "./node_modules/*" | wc -l
}


