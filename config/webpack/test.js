const environment = require('./environment')

module.exports = environment.toWebpackConfig()
// module.exports.node = { fs: 'empty' }
module.exports.target = "node" // evita problema can't resolve fs alla compilazione di modernizr
