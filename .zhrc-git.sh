#
#
# Configuring and Testing
#
#

# git config editor
gce() {
  # config sublime as the default text editor for git; make sure subl is in the PATH
  git config --global core.editor "subl -n -w"
}

# git config passcode - make sure .git-credentials is populated from a private repo
gcp() {
  git config --global credential.helper store
}

# git test - make sure you have setup public/private keys
gt() {
  if ssh -T -o ConnectTimeout=2 git@github.com 2>&1 | grep -q "successfully authenticated"; then
    echo "SSH to GitHub is available"
  else
    echo "SSH to GitHub timed out or failed"
  fi
}

# when in a repo, this shows all applied settings, and their origin
# note git has system, global, and local config files; similar to CSS, values cascade, but up intead of down
gcl() {
  git config --list --show-origin
}

gCloneAll() {
  git clone git@github.com:caaker/caaker.github.io.git
  git clone git@github.com:caaker/frame-arc.git
  git clone git@github.com:caaker/frame-client.git
  git clone git@github.com:caaker/frame-config.git
  git clone git@github.com:caaker/frame-server.git
  git clone git@github.com:caaker/learn.git
  # git clone git@github.com:caaker/private.git
}

gCloneAllHTTPS() {
  git clone https://github.com/caaker/caaker.github.io.git
  git clone https://github.com/caaker/frame-arc.git
  git clone https://github.com/caaker/frame-client.git
  git clone https://github.com/caaker/frame-config.git
  git clone https://github.com/caaker/frame-server.git
  git clone https://github.com/caaker/learn.git
  # git clone https://github.com/caaker/private.git
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
  git push origin main
}

gpull() {
  git pull origin main
}

gdeploy() {
  ga
  gc
  gpush
}

gdeployall() {
  f-ca
  gdeploy
  f-a
  gdeploy
  f-cl
  gdeploy
  f-c
  gdeploy
  f-s
  gdeploy
  f-l
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


#
#
# Move this
#
#

deployBundle() {
  cp -v ~/top/frame-server/dist/bundle.js ~/top/caaker.github.io
}

updateCache() {
  curl -s https://frame-server-x8qw.onrender.com/articles/get | jq.node | \
  tee ~/top/caaker.github.io/cache.txt ~/top/frame-server/dist/cache.txt > /dev/null
}
