#= require templates/about_us/album.jst.eco

class AboutUs
  load: ->
    $('.m-about_us--download-button').click(-> Analytical.event('Download the registration form'))
    $.get('/about_us_photos/', (json) ->
      if json.photos
        $('.m-about_us--photos').html(JST['templates/about_us/album'](photos: json.photos))
        $('.m-about_us--photos').flexslider()
    )

$(-> new AboutUs().load())
