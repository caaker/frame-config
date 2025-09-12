const path = require('path');
require('./webpack.global');

const CopyWebpackPlugin = require('/home/caaker/top/frame-client/node_modules/copy-webpack-plugin');


const HOME = '/home/caaker';

const css = {
  test: /\.css$/i,
  use: ['style-loader', 'css-loader']
};

const jsx = {
  test: /\.(js|jsx)$/, 
  include: path.resolve(HOME, 'top/frame-client'),
  exclude: /node_modules/,
  use: {
    loader: 'babel-loader',
    options: {
      presets: ['@babel/preset-env', '@babel/preset-react']
    }
  }
};

const tsx = {
  test: /\.(ts|tsx)$/, 
  include: path.resolve(HOME, 'top/frame-client'),
  exclude: /node_modules/,
  use: {
    loader: 'ts-loader',
    options: { configFile: path.resolve(HOME, 'top/frame-config/install/tsconfig.json') }
  }
};

const file_types = {
  rules: [
    css,
    jsx,
    tsx
  ]
};

const entry = './index.jsx';

// absolute path is required by webpack for the output path
const output = {
  filename: 'bundle.js',
  path: path.resolve(HOME, 'top/frame-server/dist')
};

const stats = { warnings: false };

const clearConsolePlugin = {
  apply: (compiler) => {
    compiler.hooks.watchRun.tap('ClearConsole', () => {
      process.stdout.write('\x1Bc'); // Clears the console
      console.logD('DEBUG: console cleared via webpack plugin: ' + time() + ' \n', 'blue');
    });
  }
};

const CopyPlugin = new CopyWebpackPlugin({
  patterns: [
    { 
      from: path.resolve(HOME, 'top/frame-server/dist/bundle.js'),
      to: path.resolve(HOME, 'top/caaker.github.io/bundle.js') 
    }
  ]
})

const config_obj = {
  stats:          stats,
  entry:          entry,
  output:         output,
  module:         file_types,
  plugins:        [clearConsolePlugin, CopyPlugin]
};

module.exports = (env) => {
  return config_obj;
};