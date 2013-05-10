RailsAdmin.config do |config|
  config.model Event do
    list do
      items_per_page 100
      sort_by :end_at
      sort_reverse false

      field :title
      field :begin_at
      field :end_at
    end

    edit do
      field :title
      field :album_title
      field :description
      field :place
      field :begin_at
      field :end_at
    end
  end
end
