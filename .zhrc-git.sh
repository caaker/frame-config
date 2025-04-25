#
#
# Configuring and Testing
#
#


gce() {
  # config sublime as the default text editor for git; make sure subl is in the PATH
  git config --global core.editor "subl -n -w"
}

# git test
gt() {
  ssh -T git@github.com
}

# when in a repo, this shows all applied settings, and their origin
# note git has system, global, and local config files; similar to CSS, values cascade, but up intead of down
gcl() {
  git config --list --show-origin
}

gcloneall() {
  git clone git@github.com:caaker/caaker.github.io.git
  git clone git@github.com:caaker/frame-arc.git
  git clone git@github.com:caaker/frame-client.git
  git clone git@github.com:caaker/frame-config.git
  git clone git@github.com:caaker/frame-server.git
  git clone git@github.com:caaker/learn.git
  git clone git@github.com:caaker/private.git
}


#
#
# Deploying - Pushing and Pulling
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

gpush() {
  if ssh -o ConnectTimeout=2 -q -T git@github.com; then
    git push origin main
  else
    git push horigin main
  fi
}

gpull() {
  git pull origin main
}

deployBundle() {
  cp -v /Users/chrisaaker/top/frame-server/dist/bundle.js /Users/chrisaaker/top/caaker.github.io
}

gdeploy() {
  gs
  ga
  gc
  gpush
}

# copies server bundle to static site
# deploys client, static site, and server
gdeployall() {
  deploy
  f-cl
  gdeploy
  f-ca
  gdeploy
  f-s
  gdeploy
}


#
#
# Inspecting
#
#


# git remote verbose
gr() {
  git remote -v
}

# git short log, -s shows number of commits for each author
gshort() {
  git shortlog -s
}

# show the last commit or a specific commit
gshow() {
  git show "${1:-HEAD}"
}


#
#
# Caching
#
#


updateCache() {
  curl -s https://frame-server-x8qw.onrender.com/articles/get | jq.node | tee /Users/chrisaaker/top/caaker.github.io/cache.txt /Users/chrisaaker/top/frame-server/dist/cache.txt > /dev/null
}
