const { environment } = require('@rails/webpacker');

const webpack = require('webpack');
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: "jquery",
  jquery: "jquery",
  "window.jQuery": "jquery",
  jQuery:"jquery",
  Popper: ['popper.js', 'default']
}))


module.exports = environment;

// module.exports.node = { fs: 'empty' }
// module.exports.target = "node" // evita problema can't resolve fs alla compilazione di modernizr

//Con il plugin Provide rende disponibile jquery a tutti i js
