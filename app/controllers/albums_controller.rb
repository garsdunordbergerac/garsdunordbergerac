class AlbumsController < ApplicationController
  respond_to :json

  def show
    @event = Event.find(params[:id])
    if @event.album_title?
      @album_entries = FetchPhotosByAlbum.new(@event.album_title).call

      render 'albums/show'
    else
      render json: {}
    end
  end
end
