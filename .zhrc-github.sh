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


zipLambda() {
  cd ~/top/frame-lambda-test
  zip -r frame-lambda-test.zip . --exclude "*/node_modules/*"
}

uploadLambda() { 
  aws lambda update-function-code \
    --function-name frame-lambda-test \
    --zip-file fileb://~/top/frame-lambda-test/frame-lambda-test.zip
}

testLambda() {
  curl -X GET https://wwe1zu5p68.execute-api.us-east-2.amazonaws.com/frame-lambda-test
}

installAWS() {
  mkdir -p ~/aws-cli
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o ~/aws-cli/awscliv2.zip
  unzip ~/aws-cli/awscliv2.zip -d ~/aws-cli
  cd ~/aws-cli
  sudo ./aws/install
}


# pip requires - 727 or 737#
# https://wwe1zu5p68.execute-api.us-east-2.amazonaws.com
installvenv() {

}