class EventsController < ApplicationController
  include ActionView::Helpers::TextHelper

  respond_to :json

  def index
    year    = params[:year].to_i
    @events = Event.for_year(year)

    render 'events/index'
  end
end
