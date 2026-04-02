#
# NPM INSTALLS
#

# install client side npm packages
iClient() {
  npm i @reduxjs/toolkit react react-dom react-redux frame-arc
  npm i -D vite @vitejs/plugin-react
}

# install server side npm packages
# update this later for JWT implementation, we can reduce to
# npm i express mongoose passport passport-google-oauth20 ws
iServer() {
  npm i express express-session
  npm i mongoose
  npm i passport passport-google-oauth
  npm i ws
  echo "< message > Server-side npm packages installed < message >"
}