class AboutUsPhotosController < ApplicationController
  respond_to :json

  def index
      client = Picasa::Client.new(user_id: ENV['ALBUM_USER_ID'])
      album  = client.album.list.entries.find { |album| album.title == 'a-propos' }

      render json: { photos: client.album.show(album.id).entries.map { |entry| entry.content.src }}
  end
end
