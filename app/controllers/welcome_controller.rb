class WelcomeController < ApplicationController
  def index
    @events      = Event.order('begin_at desc')
    @next_event  = Event.next
  end
end
