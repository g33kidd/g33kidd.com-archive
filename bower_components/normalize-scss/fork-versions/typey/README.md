# Fork-able normalize-scss<br> for Typey

## Using with node-sass

1. Copy these files to your Sass project.
2. This fork-able version requires the [support-for](https://github.com/JohnAlbin/support-for) Sass module and the [typey](https://github.com/jptaranto/typey) Sass module. Add it to your package.json with:

 ```bash
npm install --save-dev support-for typey
```

3. Add support-for's `sass` directory to your nodeSass' [`includePaths` option](https://github.com/sass/node-sass#includepaths).

 ```js
var sass = require('node-sass'),
  path = require('path');

sass.render({
  file: scss_filename,
  includePaths: [
    path.join(__dirname, 'node_modules/support-for/sass'),
    path.join(__dirname, 'node_modules/typey/stylesheets'),
  ]
}, function(err, result) { /*...*/ });
```

## Using with libSass

If you are not using node-sass with libSass, you probably already know how to include 3rd party libraries into your Sass project.

1. Copy these files to your Sass project.
2. This fork-able version requires the [support-for](https://github.com/JohnAlbin/support-for) Sass module and the [typey](https://github.com/jptaranto/typey) Sass module. Add support-for's `sass` directory and typey's `stylesheets` directory to your libSass include paths in the "usual way".

## Using with Ruby Sass

In addition to copying these files to your Sass project, you'll also need to:

1. Edit your `Gemfile` file to add:

 ```ruby
gem 'support-for', '~> 1.0'
gem 'typey', '~> 1.0.0.beta.7'
```

2. If you use Compass, edit your `config.rb` file to add:

 ```ruby
require 'support-for'
require 'typey'
```

3. Update your local Gems with:

 ```
bundle install
```
