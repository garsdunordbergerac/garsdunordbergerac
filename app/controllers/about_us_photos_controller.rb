class AboutUsPhotosController < ApplicationController
  respond_to :json

  def index
    album_entries = FetchPhotosByAlbum.new('72157665938468690').call

    render json: { photos: album_entries }
  end
end
