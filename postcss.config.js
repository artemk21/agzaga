module.exports = {
  plugins: [
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    })
  ]
}

# touched on 2025-07-09T17:31:36.825646Z
# touched on 2025-07-09T19:43:32.020782Z