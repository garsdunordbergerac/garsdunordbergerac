#= require jquery
#= require jquery_ujs
#= require jquery.royalslider
#= require jquery.smooth-scroll
#= require jquery.carouFredSel
#= require foundation

#= require about_us
#= require contact_form
#= require contact_map
#= require events
#= require home

window.onload = ->
  $(document).foundation()
  $('a[data-smooth]').smoothScroll(offset: -45, easing: 'swing', speed: 800, afterScroll: (event)-> $(event.scrollTarget).trigger('scrollEnter'))
