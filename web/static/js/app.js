// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "deps/phoenix_html/web/static/js/phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
$(document).ready(() => {
  // Replaces spaces and trim chars
  var slugify = (string) => {
    return string.toString().toLowerCase()
      .replace(/\s+/g, '-')
      .replace(/[^\w\-]+/g, '')
      .replace(/\-\-+/g, '-')
      .replace(/^-+/, '')
      .replace(/-+$/, '')
  }

  var simplemde = new SimpleMDE();

  $("#post-title").on('keyup', function() {
    var slugged_title = slugify($(this).val())
    console.log(slugged_title)
    $("#post-slug").val(slugged_title)
  })

  simplemde.codemirror.on('change', function() {
    $("#post-body").val(simplemde.value())
  })

})
