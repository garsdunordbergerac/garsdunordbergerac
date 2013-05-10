#= require templates/summaries/list

class Summaries
  changeYear: (event) =>
    event.preventDefault()
    return if $(event.target).parent().hasClass('active')

    $('.m-summaries--years .active').removeClass('active')
    $(event.target).parent().addClass('active')
    @loadSummariesForYear()

  load: ->
    @loadSummariesForYear()
    $('.m-summaries--years').on('click', 'a', @changeYear)

  loadSummariesForYear: ->
    year = $('.m-summaries--years .active').data('year')
    $.get("/summaries?year=#{year}", (summaries)->
      $('.m-summaries--list').html(JST['templates/summaries/list'](summaries: summaries)))

$(-> new Summaries().load())
