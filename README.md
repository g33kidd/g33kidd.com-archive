## Blog

Just a work-in-progress. Feel free to install it and check it out. See the bottom of this doc on how to get started. 

## TODO
#### Front-end
- Add `Template` Schema and render templates based on @view_template. see https://groups.google.com/forum/#!topic/phoenix-talk/GgyvIZdaUIA
- Add `View Mode` to Post. `public | private | draft`
- 

#### API/Server
- Better authentication. Remove Joken and use something like `Guardian`. see http://blog.overstuffedgorilla.com/simple-guardian/

#### Admin/React
- Modal Component
- Re-structure the PostStore, AuthStore, and other stores.
- Markdown Editor for the Posts; with custom addons? Can React easily be extended? Checkout N1 email client and other solutions on how to create a plugin system for react?

```
Template1 {name: "header.html", content: "<h1>some_html</h1>", partial: true}
Template2 {name: "index.html", content: "htmldoc... <%= get_partial ("header.html") %> ...", partial: false, assigns: []}
^^ Template partials stored in the DB. 
```

## Some Ideas
Hopefully get my Elixir implementation of libsass working; then add some fun real-time editing features with Sass and Templates. That library is here: https://github.com/g33kidd/exsass

## Getting Started
You might want to install elixir, phoenix, and webpack if you want. You should have Node and npm installed.

Just run `npm install && mix deps.get && `


## Deploayment
Noyhing here yet, but there will be soon.
