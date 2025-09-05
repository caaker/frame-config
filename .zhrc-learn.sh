#
#
# C
#
#


# gcc compile and run a single file, $1 holds argument #1
gcr() {
  gcc $1
  ./a.out
}


#
#
# Java
#
#


# java compile and run a single class
jcr() {
  javac "$1" -d classes
  # java -cp classes/
}


# java compile and run a multiple classes
jcrm() {
  javac $1/Main.java -d classes
  java -cp classes/ "$1.Main"
}
