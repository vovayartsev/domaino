var webpack = require('webpack');
// Your package.json should include related packages
// Remember to run npm install before starting Rails app
var config = {
  plugins: [
    new webpack.ProvidePlugin({
      riot: 'riot',
      jQuery: 'jquery'
    })
  ],
  module: {
    preLoaders: [
      { test: /\.tag$/, exclude: /node_modules/, loader: 'riotjs-loader', query: { type: 'none' } }
    ],
    loaders: [
      {
        test: /\.js$|\.tag$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        query: {
          plugins: ['transform-runtime'],
          presets: ['es2015', 'stage-0'],
        }
      },
      { test: /\.css$/, loader: "style-loader!css-loader" },
      { test: /\.png$/, loader: "url-loader?mimetype=image/png" },
      { test: /\.svg$/, loader: 'url-loader?mimetype-loader=image/svg+xml' },
      { test: /\.woff$/, loader: 'url-loader?mimetype=applic-loaderation/font-woff' },
      { test: /\.woff2$/, loader: 'url-loader?mimetype=application/f-loaderont-woff2' },
      { test: /\.ttf$|\.eot$/, loader: 'file-loader'}
    ]
  }
};

// if NODE_ENV not set, it defaults to Rails.env (for Rails apps) or ENV['RACK_ENV'].
// Otherwise it's always "development"
if (process.env.NODE_ENV == 'development') {
  config.devtool = '#eval-source-map';
}

module.exports = config;
