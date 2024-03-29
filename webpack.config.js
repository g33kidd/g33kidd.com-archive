'use strict';
var webpack = require('webpack');

module.exports = {
  entry: {
    admin: './admin/js',
    app: './web/static/js'
  },
  output: {
    filename: '[name].js',
    path: './priv/static/js'
  },
  resolve: {
    extensions: ['', '.js', '.jsx', '.es6'],
    modulesDirectories: [
      './node_modules',
      './node_modules/simplemde/src/js',
      './deps/phoenix/web/static/js',
      './deps/phoenix_html/web/static/js'
    ],
  },
  stats: {
    colors: true,
    reasons: true
  },
  module: {
    loaders: [
      {
        test: /\.(js|jsx)$/,
        loaders: ["babel"],
        exclude: /node_modules/
      },

      {
        test: /\.scss$/,
        loaders: [
          "style",
          "css",
          "autoprefixer?browsers=last 3 versions",
          "sass?outputStyle=expanded"
        ]
      },

      {
        test: /\.css$/,
        loaders: [
          "style",
          "css"
        ]
      }

      // { test: /\.jsx$/,                         loader: 'babel-loader?stage=0', exclude: /(node_modules)/ },
      // // { test: /\.(cjsx|coffee)$/,              loader: "coffee-jsx-loader" },
      // // { test: /\.(png|jpg)$/,                  loader: 'url-loader?prefix=assets/' },
      // { test: /\.scss/,                        loader: 'style-loader!css-loader!sass-loader?outputStyle=expanded' },
      // { test: /\.css$/,                        loader: 'style-loader!css-loader' },
      // { test: /\.woff(\?v=\d+\.\d+\.\d+)?$/,   loader: "url?limit=10000&mimetype=application/font-woff" },
      // { test: /\.woff2(\?v=\d+\.\d+\.\d+)?$/,  loader: "url?limit=10000&mimetype=application/font-woff" },
      // { test: /\.ttf(\?v=\d+\.\d+\.\d+)?$/,    loader: "url?limit=10000&mimetype=application/octet-stream" },
      // { test: /\.eot(\?v=\d+\.\d+\.\d+)?$/,    loader: "file" },
      // { test: /\.svg(\?v=\d+\.\d+\.\d+)?$/,    loader: "url?limit=10000&mimetype=image/svg+xml" }
    ]
  }
};
