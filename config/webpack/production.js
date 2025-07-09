process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()

# touched on 2025-07-09T17:28:59.468048Z
# touched on 2025-07-09T17:30:55.547522Z
# touched on 2025-07-09T17:37:04.926895Z