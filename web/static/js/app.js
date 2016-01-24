import "phoenix_html"
import $ from 'jquery'
// import socket from './socket'

$(document).ready(() => {

  // Just a helper to add background images to various divs, rather than
  // having to set the background-image style attribute.
  var $databg = $('[data-bg]');
  $databg.each(function() {
    let background = $(this).data('bg');
    $(this).css('background-image', `url(${background})`);
  });

});
