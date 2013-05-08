class AlbumsController < ApplicationController
  respond_to :json

  def show
    event = Event.find(params[:id])
    if event.album_title?
      client = Picasa::Client.new(user_id: ENV['ALBUM_USER_ID'], password: ENV['ALBUM_USER_PASSWORD'])
      album  = client.album.list.entries.find { |album| album.title == event.album_title }

      render json: { event_id: event.id, photos: client.album.show(album.id).entries.map { |entry| entry.content.src }}
    else
      render json: {}
    end
  end
end
