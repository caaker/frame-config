const css = {
  test: /\.css$/i,
  use: ['style-loader', 'css-loader']
};

const jsx = {
  test: /\.jsx?/,
  include: '/Users/chrisaaker/top/frame-client',
  exclude: /node_modules/,
  use: {
    loader: 'babel-loader',
    options: {
      presets: ['@babel/preset-env', '@babel/preset-react']
    }
  }
};

const file_types = {
  rules: [
    css,
    jsx
  ]
};

const entry = './index.jsx';

// absolute path is required by webpack for the output path
const output = {
  filename: 'bundle.js',
  path: '/Users/chrisaaker/top/frame-server/dist'
};

const stats = { warnings: false };

const clearConsolePlugin = {
  apply: (compiler) => {
    compiler.hooks.watchRun.tap('ClearConsole', () => {
      process.stdout.write('\x1Bc'); // Clears the console
    });
  }
};

const config_obj = {
  stats:          stats,
  entry:          entry,
  output:         output,
  module:         file_types,
  plugins:        [clearConsolePlugin]
};

module.exports = (env) => {
  return config_obj;
};