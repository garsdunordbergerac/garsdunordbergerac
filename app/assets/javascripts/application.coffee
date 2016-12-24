#= require ckeditor/init
#= require jquery
#= require jquery_ujs
#= require jquery.flexslider
#= require jquery.smooth-scroll
#= require foundation

#= require about_us
#= require contact_form
#= require contact_map
#= require events
#= require home

window.onload = ->
  $(document).foundation()
  $('a[data-smooth]').smoothScroll(offset: -45, easing: 'swing', speed: 800, afterScroll: (event)-> $(event.scrollTarget).trigger('scrollEnter'))
