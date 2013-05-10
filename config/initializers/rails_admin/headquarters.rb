RailsAdmin.config do |config|
  config.model Event do
    list do
      items_per_page 100
      sort_by :title
      sort_reverse false

      field :title
      field :street
      field :post_code
      field :city
    end

    edit do
      field :title
      field :street
      field :post_code
      field :city
      field :latitude
      field :longitude
    end
  end
end
