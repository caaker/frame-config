#
#
# Git Quick Functions
#
#

# git add all
ga() {
  git add .
}

# git commit 
# :- is a parameter expansion that specifies a default value
gc() {
  local msg="${1:-auto-commit}"
  git commit -m "$msg"
}

# git short log
# -s shows commits for each author
gshort() {
  git shortlog -s
}

# show the last commit or a specific commit
# https://www.warp.dev/terminus/git-commit-history
gshow() {
  git show "${1:-HEAD}"
}

gcl() {
  git config --list --show-origin
}

# git remote verbose
gr() {
  git remote -v
}

# git status
gs() {
  git status
}

# git test
gt() {
  ssh -T git@github.com
}

gpullom() {
  git pull origin main
}

gpushom() {
  git push origin main
}

#
#
# Git Functions
#
#

# note git has system, global, and local config files; similar to CSS, values cascade, but up intead of down
# when in a repo, this shows all applied settings, and their origin
gcl() {
  git config --list --show-origin
}

setupgeditor() {
  # set sublime as the default text editor for git; make sure subl is in the PATH
  git config --global core.editor "subl -n -w"
}
