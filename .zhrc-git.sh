#
#
# Configuring and Testing
#
#

# git config editor - config sublime as the default text editor for git; make sure subl is in the PATH
gce() {
  git config --global core.editor "subl -n -w"
}

# git config pat - this command allows you to have to enter your pat only once for https://
# note that ~/.get-credentials is only used initially and then the pat is moved to memory for security reasons 
gcp() {
  git config --global credential.helper store
}

# git test - make sure you have setup a public/private key pair for ssh:// repos
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


#
#
# Convenience
#
#


gCloneAll() {
  git clone https://github.com/caaker/caaker.github.io.git
  git clone https://github.com/caaker/frame-arc.git
  git clone https://github.com/caaker/frame-client.git
  git clone https://github.com/caaker/frame-config.git
  git clone https://github.com/caaker/frame-server.git
  git clone https://github.com/caaker/learn.git
  git clone https://github.com/caaker/private.git
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
  gdeploy
  f-p
  gdeploy
  f-b
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
