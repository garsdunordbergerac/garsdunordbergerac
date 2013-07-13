class WelcomeController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @json = json
  end

private

  def json
    [
      :next_event,
      :contents,
      :numbers,
      :event_years,
      :contacts,
      :headquarter
    ].reduce({}) { |hash, method_name| hash.merge(send(method_name)) }
  end

  def contacts
    json = { contacts: [] }
    Contact.all.each do |contact|
      json[:contacts] << {
        email:    contact.email,
        name:     contact.name,
        position: contact.position
      }
    end

    json
  end

  def contents
    json = { contents: {} }
    Content.all.each do |content|
      json[:contents][content.code] = simple_format(CGI.escapeHTML(content.content))
    end

    json
  end

  def event_years
    { event_years: Event.years }
  end

  def headquarter
    headquarter = Headquarter.last
    { headquarter: {
        city:      headquarter.city,
        latitude:  headquarter.latitude,
        longitude: headquarter.longitude,
        street:    headquarter.street,
        postcode:  headquarter.postcode,
        title:     headquarter.title
      }
    }
  end

  def next_event
    json  = { next_event: nil }
    if (event = Event.next)
      json[:next_event] = {
        begin_at: event.begin_at,
        end_at:   event.end_at,
        title:    event.title,
      }
    end

    json
  end

  def numbers
    json = { numbers: {} }
    Number.all.each do |number|
      json[:numbers][number.code] = number.value
    end

    json
  end
end
