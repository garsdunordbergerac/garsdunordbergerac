class EventsController < ApplicationController
  include ActionView::Helpers::TextHelper

  respond_to :json

  def index
    year   = params[:year].to_i
    events = Event.for_year(year).each { |event| event.description = format_description(event.description) }

    render json: events
  end

private

  def format_description(description)
    simple_format(CGI.escapeHTML(description))
  end
end
