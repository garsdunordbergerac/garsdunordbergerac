#= require jquery
#= require jquery_ujs
#= require jquery.royalslider
#= require jquery.smooth-scroll
#= require jquery.carouFredSel
#= require foundation

#= require contact_form
#= require contact_map
#= require events
#= require summaries

window.onload = ->
  $(document).foundation()
  $('a[data-smooth]').smoothScroll(offset: -45, easing: 'swing', speed: 800)
