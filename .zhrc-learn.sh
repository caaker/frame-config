#
#
#
#
#

# C
# gcc compile and run a single file, $1 holds argument #1
gcr() {
  gcc $1
  ./a.out
}

# C++
# g++ compile and run a single file, $1 holds argument #1
gpcr() {
  g++ $1
  ./a.out
}

# Java
# java compile and run a single class
# javac compiles to bytecode and then java interprets the bytecode
# if needed install the java sdk - sudo apt install default-jdk
jcr() {
  javac "$1" -d classes
  java -cp classes "${1%.java}"
}



# java compile and run a multiple classes
jcrm() {
  javac $1/Main.java -d classes
  java -cp classes/ "$1.Main"
}
