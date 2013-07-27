#= require templates/events/album.jst.eco
#= require templates/events/list.jst.eco

class Events
  changeYear: (event) =>
    event.preventDefault()
    return if $(event.target).parent().hasClass('active')

    $('.m-events--years .active').removeClass('active')
    $(event.target).parent().addClass('active')
    @loadEventsForYear()

  load: ->
    @loadEventsForYear()
    $('.m-events--years').on('click', 'a', @changeYear)

  loadEventsForYear: ->
    year = $('.m-events--years .active').data('year')
    $.get("/events?year=#{year}", (events)=>
      $('.m-events--list').html(JST['templates/events/list'](events: events))
      @startCarousel()
      @loadPhotosForEvent(event) for event in events
    )

  loadPhotosForEvent: (event) ->
    $.get("/albums/#{event.id}", (json) ->
      if json.photos
        $(".m-event[data-id='#{json.event_id}'] .m-event--photos").hide()
        $(".m-event[data-id='#{json.event_id}'] .m-event--photos").html(JST['templates/events/album'](photos: json.photos))
        $(".m-event[data-id='#{json.event_id}'] .m-event--photos").fadeIn(complete: ->
          $(".m-event[data-id='#{json.event_id}'] .m-event--photos").carouFredSel()
        )
    )

  startCarousel: ->
    $('.m-events--list .royalSlider').royalSlider({
      arrowsNav:                false,
      fadeinLoadedSlide:        true,
      controlNavigationSpacing: 0,
      controlNavigation:        'thumbnails',
      thumbs: {
        autoCenter:    false,
        fitInViewport: true,
        orientation:   'vertical',
        spacing:       0,
        paddingBottom: 0
      },
      slidesSpacing:   0,
      loop:            false,
      loopRewind:      true,
      navigateByClick: false,
      sliderDrag:      false
    }).data('royalSlider').ev.on('rsAfterSlideChange', (event) ->
      photos = event.target.currSlide.holder.find('.m-event--photos')
      photos.carouFredSel() if photos
    )

$(-> new Events().load())
