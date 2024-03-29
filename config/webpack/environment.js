const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

// Add an ProvidePlugin
environment.plugins.prepend('Provide',  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    'window.Tether': "tether",
    Popper: ['popper.js', 'default'],
    ActionCable: 'actioncable',
    Vue: 'vue',
    VueResource: 'vue-resource',
  })
)

const config = environment.toWebpackConfig()

config.resolve.alias = {
  jquery: "jquery/src/jquery",
  vue: "vue/dist/vue.js",
  vue_resource: "vue-resource/dist/vue-resource",
}

// export the updated config
module.exports = environment

// const { environment } = require('@rails/webpacker')

// const webpack = require('webpack')

// // Preventing Babel from transpiling NodeModules packages
// environment.loaders.delete('nodeModules');

// // Bootstrap 4 has a dependency over jQuery & Popper.js:
// environment.plugins.prepend('Provide',
//   new webpack.ProvidePlugin({
//     $: 'jquery',
//     jQuery: 'jquery',
//     Popper: ['popper.js', 'default']
//   })
// )



// module.exports = environment
