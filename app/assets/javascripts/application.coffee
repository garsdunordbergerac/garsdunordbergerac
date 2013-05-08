#= require jquery
#= require jquery_ujs
#= require jquery.royalslider
#= require jquery.smooth-scroll
#= require jquery.carouFredSel
#= require foundation

#= require templates/events/list.jst.eco
#= require_tree .

window.onload = ->
  $(document).foundation()

  $('a[data-smooth]').smoothScroll(
    offset: -45,
    easing: 'swing',
    speed:  800
  )

  #events
  loadEventsForYear()
  $('.m-events--years').on('click', 'a', (event) ->
    event.preventDefault()
    return if $(this).parent().hasClass('active')

    $('.m-events--years .active').removeClass('active')
    $(this).parent().addClass('active')
    loadEventsForYear()
  )

  # summaries
  loadSummariesForYear()
  $('.m-summaries--years').on('click', 'a', (event) ->
    event.preventDefault()
    return if $(this).parent().hasClass('active')

    $('.m-summaries--years .active').removeClass('active')
    $(this).parent().addClass('active')
    loadSummariesForYear()
  )

  # contact
  initializeContactMap()
  $('.m-contact--form').on('ajax:success', (event, data, status, xhr) ->
    $('.m-contact--form *').removeClass('error')
    if data.errors == undefined
      $('.m-contact--form').html(JST['templates/contact/success']())
    else
      for attribute, messages of data.errors
        $(".m-contact--form--#{attribute}").addClass('error')
  )

loadEventsForYear = ->
  year = $('.m-events--years .active').data('year')
  $.get("/events?year=#{year}", (events)->
    $('.m-events--list').html(JST['templates/events/list'](events: events))
    $('.m-events--list .royalSlider').royalSlider({
      arrowsNav: false,
      fadeinLoadedSlide: true,
      controlNavigationSpacing: 0,
      controlNavigation: 'thumbnails',
      thumbs: {
        autoCenter: false,
        fitInViewport: true,
        orientation: 'vertical',
        spacing: 0,
        paddingBottom: 0
      },
      slidesSpacing: 0,
      loop: false,
      loopRewind: true,
      navigateByClick: false,
      sliderDrag: false
    })

    for event in events
      $.get("/albums/#{event.id}", (json) ->
        if json.photos
          $(".m-event[data-id='#{json.event_id}'] .m-event--photos").hide()
          $(".m-event[data-id='#{json.event_id}'] .m-event--photos").html(JST['templates/events/album'](photos: json.photos))
          $(".m-event[data-id='#{json.event_id}'] .m-event--photos").fadeIn()
          $(".m-event[data-id='#{json.event_id}'] .m-event--photos").carouFredSel()
      )
  )

loadSummariesForYear = ->
  year = $('.m-summaries--years .active').data('year')
  $.get("/summaries?year=#{year}", (summaries)->
    $('.m-summaries--list').html(JST['templates/summaries/list'](summaries: summaries)))

initializeContactMap = ->
  place      = new google.maps.LatLng(44.8433237, 0.4955673)
  mapOptions =
    styles: [
      {
        stylers: [
          { saturation: -100 }
        ]
      },
      {
        featureType: 'road'
        elementType: 'geometry'
        stylers: [
          { lightness: 100 }
          { visibility: 'simplified' }
        ]
      }
      {
        featureType: 'road'
        elementType: 'labels'
        stylers: [
        ]
      }
    ]
    zoom: 16
    zoomControlOptions:
      style:    google.maps.ZoomControlStyle.LARGE,
      position: google.maps.ControlPosition.TOP_RIGHT
    draggable:         $(window).width() >= 640
    mapTypeControl:    false
    navigationControl: false
    streetViewControl: false
    scrollwheel:       false
    scaleControl:      false
    center:            place
    mapTypeId:         google.maps.MapTypeId.ROADMAP

  map    = new google.maps.Map(document.getElementById('m-contact--map'), mapOptions)
  marker = new google.maps.Marker({
    position: place
    map:      map
    title:    'Bar-tabac Le Relax'
  })

