#
#
# Java
#
#


# java compile and run
# use for single class
jcr1() {
  javac $1 -d classes
  java ${1//.java}
}

# use for multiple classes in a single package
jcr() {
  javac $1/Main.java -d classes
  java -cp classes/ "$1.Main"
}


#
#
# C
#
#


# c compile and run
# use for a single file
gcr() {
  gcc $1
  ./a.out
}

# {
#   "shell_cmd": "javac \"$file\"",
#   "file_regex": "^(...*?):([0-9]*):?([0-9]*)",
#   "selector": "source.java"
# }
