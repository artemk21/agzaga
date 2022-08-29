process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()

# touched on 2025-07-09T17:33:06.090668Z
# touched on 2025-07-09T17:43:12.624991Z
# touched on 2025-07-09T19:40:15.959609Z
# touched on 2025-07-09T19:44:44.948912Z