class EventsController < ApplicationController
  include ActionView::Helpers::TextHelper

  respond_to :json

  def index
    year = params[:year].to_i
    events = Event.for_year(year).map { |event|
      event.description = simple_format(CGI.escapeHTML(event.description))
      event
    }

    render json: events
  end
end
