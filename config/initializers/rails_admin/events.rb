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
      field :place
      field :begin_at
      field :end_at
      field :album_title
      field :description, :ck_editor
    end
  end
end
