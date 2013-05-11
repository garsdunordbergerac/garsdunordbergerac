#= require templates/about_us/album.jst.eco

class AboutUs
  load: ->
    $.get('/about_us_photos/', (json) ->
      if json.photos
        $('.m-about_us--photos').html(JST['templates/about_us/album'](photos: json.photos))
        $('.m-about_us--photos').fadeIn(complete: -> $('.m-about_us--photos').carouFredSel())
    )

$(-> new AboutUs().load())
