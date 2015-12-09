exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: "js/app.js"
      // order: {
      //   before: [
      //     "bower_components/react/react.js",
      //     "bower_components/react/react-dom.js"
      //   ]
      // }

      // To use a separate vendor.js bundle, specify two files path
      // https://github.com/brunch/brunch/blob/stable/docs/config.md#files

      // To change the order of concatenation of files, explicitly mention here
      // https://github.com/brunch/brunch/tree/master/docs#concatenation
    },
    stylesheets: {
      joinTo: {
        "css/app.css": "web/static/css/app.scss",
        "css/admin.css": "web/static/css/admin.scss"
      }
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/web/static/assets". Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: /^(web\/static\/assets)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: [
      "deps/phoenix/web/static",
      "deps/phoenix_html/web/static",
      "web/static",
      "bower_components/react",
      "test/static"
    ],

    // Where to compile files to
    public: "priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/web\/static\/vendor/]
    },

    // if you want to use SASS library. Susy, composer, etc...
    sass: {
      options: {
        includePaths: [
          'bower_components/support-for/sass',
          'bower_components/susy/sass'
        ]
      }
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["web/static/js/app"]
    }
  },

  npm: {
    enabled: true
  }
};
