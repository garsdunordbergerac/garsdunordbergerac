class Home
  load: ->
    $('.m-home--about-us-button').click(-> Analytical.event('Click on the "learn more" button on the home'))

$(-> new Home().load())
