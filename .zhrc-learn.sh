#
#
#  C/C++
#
#

# C - gcc compile & run a single file
gcr() {
  gcc $1
  ./a.out
}

# C++ - g++ compile & run a single file
gpcr() {
  g++ $1
  ./a.out
}


#
#
# Java
#
#


# Java - javac compile and run
jcr() {
  # -d sets the destination to /classes
  javac "$1" -d classes
  
  # -cp set the classpath to classes, ${1%.java} removes the .java extension
  java -cp classes "${1%.java}"
}

# java general
jgen() {
  # if needed install the java sdk
  #sudo apt install default-jdk
  echo $CLASSPATH
}
  

# java compile and run multiple classes
# any class with main() can be an entry point, but we will use the standard Main.java
# $1 is both the folder name and the package name
jcrm() {
  javac $1/Main.java -d classes
  java -cp classes/ "$1.Main"
}


#
#
# Python
#
#


# run all python files
runPython() {
  rc
  for file in *.py; do
    [ -f "$file" ] && python3 "$file"
  done
}
