const path = require('path');
const webpack = require('webpack');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

let config = {
  entry: {
    'main.bundle.js': './src/assets/javascripts/main.js',
    'main.bundle.css': './src/assets/stylesheets/main.scss'
  },
  output: {
    filename: '[name]',
    path: path.resolve(__dirname, '../../public/dist'),
    publicPath: '/dist/'
  },
  resolve: {
    alias: {
      amber: path.resolve(__dirname, '../../lib/amber/assets/js/amber.js')
    }
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        exclude: /node_modules/,
        use: ['css-loader']
      },
      {
        test: /\.scss$/,
        exclude: /node_modules/,
        use: ['css-loader', 'sass-loader']
      },
      {
        test: /\.(png|svg|jpg|gif)$/i,
        exclude: /node_modules/
      },
      {
        test: /\.(woff|woff2|eot|ttf|otf)$/,
        exclude: /node_modules/,
        type: 'asset/resource',
        use: [
          'file-loader'
        ]
      },
      {
        test: /\.js?$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        options: {
          presets: ['es2015']
        }
      }
    ]
  },
  plugins: [
    new MiniCssExtractPlugin(),
  ]
};

module.exports = config;
