class AlbumsController < ApplicationController
  respond_to :json

  def show
    @event = Event.find(params[:id])
    if @event.album_title?
      client         = Picasa::Client.new(user_id: ENV['ALBUM_USER_ID'])
      album          = client.album.list.entries.find { |album| album.title == @event.album_title }
      @album_entries = client.album.show(album.id).entries

      render 'albums/show'
    else
      render json: {}
    end
  end
end
