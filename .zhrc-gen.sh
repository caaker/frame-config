#
#
# Another catch all
#
#


# automate this later, make sure jq is installed for parsing json
updateCache() {
  curl -s https://frame-server-x8qw.onrender.com/articles/get | jq | \
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