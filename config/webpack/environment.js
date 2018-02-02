const { environment } = require('@rails/webpacker')

module.exports = environment
// module.exports.node = { fs: 'empty' }
module.exports.target = "node" // evita problema can't resolve fs alla compilazione di modernizr

