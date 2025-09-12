#
#
# Helpers for deployment from github
#
#


# provide databased data via a cache
updateCache() {
  curl -s https://frame-server-x8qw.onrender.com/articles/get | jq.node | \
  tee ~/top/caaker.github.io/cache.txt ~/top/frame-server/dist/cache.txt > /dev/null
}
