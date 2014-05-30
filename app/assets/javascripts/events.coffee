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
    $.get("/events.json?year=#{year}", (events)=>
      $('.m-events--list').html(JST['templates/events/list'](events: events))
      $('.m-events--list .section-container').foundation('section')
      @loadPhotosForEvent(event) for event in events
    )

  loadPhotosForEvent: (event) =>
    $.get("/albums/#{event.id}.json", (json) =>
      if json.photos
        $(".m-event[data-id='#{json.event_id}'] .m-event--photos").hide()
        $(".m-event[data-id='#{json.event_id}'] .m-event--photos").html(JST['templates/events/album'](photos: json.photos))
        $(".m-event[data-id='#{json.event_id}'] .m-event--photos").show()
        $(".m-event[data-id='#{json.event_id}'] .m-event--photos").flexslider()
    )

$(-> new Events().load())
