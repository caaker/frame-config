#
#
# Helpers for deployment from github
#
#

# serve the SPA as a static asset from github
cBundle() {
  cp -v ~/top/frame-server/dist/bundle.js ~/top/caaker.github.io
}

# provide databased data via a cache
uCache() {
  curl -s https://frame-server-x8qw.onrender.com/articles/get | jq.node | \
  tee ~/top/caaker.github.io/cache.txt ~/top/frame-server/dist/cache.txt > /dev/null
}
