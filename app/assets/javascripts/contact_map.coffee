class ContactMap
  load: ->
    headquarter = $('.m-contact--headquarters')

    map    = new google.maps.Map(document.getElementById('m-contact--map'), @mapOptions())
    marker = new google.maps.Marker({
      position: @place()
      map:      map
      title:    headquarter.data('title')
    })

  mapOptions: ->
    styles: @stylesOptions()
    zoom:   16
    zoomControlOptions:
      style:    google.maps.ZoomControlStyle.LARGE,
      position: google.maps.ControlPosition.TOP_RIGHT
    draggable:         $(window).width() >= 640
    mapTypeControl:    false
    navigationControl: false
    streetViewControl: false
    scrollwheel:       false
    scaleControl:      false
    center:            @place()
    mapTypeId:         google.maps.MapTypeId.ROADMAP

  place: ->
    headquarter = $('.m-contact--headquarters')
    new google.maps.LatLng(headquarter.data('latitude'), headquarter.data('longitude'))

  stylesOptions: ->
    [
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

$(-> new ContactMap().load())
