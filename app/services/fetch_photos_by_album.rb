class FetchPhotosByAlbum
  private

  attr_reader :album_id

  public

  def initialize(album_id)
    @album_id = album_id
  end

  def call
    fetch_entries.map(&method(:build_url))
  end

  private

  def fetch_entries
    flickr.photosets.getPhotos(photoset_id: album_id)['photo']
  end

  def build_url(entry)
    "https://farm#{entry["farm"]}.staticflickr.com/#{entry["server"]}/#{entry["id"]}_#{entry["secret"]}.jpg"
  end
end
