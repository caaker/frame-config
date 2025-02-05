#
#
# Git Functions
#
#

# git status
gs() {
  git status
}

# git diff
gd() {
  git diff
}

# git add all
ga() {
  git add .
}

# git commit :- is a parameter expansion that specifies a default value
gc() {
  local msg="${1:-auto-commit}"
  git commit -m "$msg"
}

updateCache() {
  curl -s https://frame-server-x8qw.onrender.com/articles/get | jq.node | tee /Users/chrisaaker/top/caaker.github.io/cache.txt /Users/chrisaaker/top/frame-server/dist/cache.txt > /dev/null
}

deploy() {
  cp -v /Users/chrisaaker/top/frame-server/dist/bundle.js /Users/chrisaaker/top/caaker.github.io
  # updateCache
}

gdeploy() {
  gs
  ga
  gc
  gpush
}

# git remote verbose
gr() {
  git remote -v
}

# git test
gt() {
  ssh -T git@github.com
}

gt1() {
  if ssh -o ConnectTimeout=5 -q -T git@github.com; then
    echo "ssh to git is available"
  else
    echo "ssh to git is not available"
  fi
}

gpush() {
  if ssh -o ConnectTimeout=5 -q -T git@github.com; then
    git push origin main
  else
    git push horigin main
  fi
}

gpull() {
  git pull origin main
}

#
#
# Git Functions - Refactor or Remove
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

# git short log
# -s shows commits for each author
gshort() {
  git shortlog -s
}

# show the last commit or a specific commit: https://www.warp.dev/terminus/git-commit-history
gshow() {
  git show "${1:-HEAD}"
}

