class ContactForm

  constructor: ->
    $('.m-contact--form').on('ajax:success', (event, data, status, xhr) =>
      $('.m-contact--form *').removeClass('error')
      @analyzeResult(data)
    )

  analyzeResult: (data) ->
    if data.errors == undefined
      $('.m-contact--form').html(JST['templates/contact/success']())
    else
      for attribute, messages of data.errors
        $(".m-contact--form--#{attribute}").addClass('error')

$(-> new ContactForm())
