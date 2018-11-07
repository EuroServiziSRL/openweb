const { environment } = require('@rails/webpacker');

const webpack = require('webpack');
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: "jquery",
  jquery: "jquery",
  "window.jQuery": "jquery",
  jQuery:"jquery",
  Popper: ['popper.js', 'default']
}))


module.exports = environment.toWebpackConfig();
// module.exports.node = { fs: 'empty' }
// module.exports.target = "node" // evita problema can't resolve fs alla compilazione di modernizr