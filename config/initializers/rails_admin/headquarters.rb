RailsAdmin.config do |config|
  config.model Headquarter do
    list do
      items_per_page 100
      sort_by :title
      sort_reverse false

      field :title
      field :street
      field :postcode
      field :city
    end

    edit do
      field :title
      field :street
      field :postcode
      field :city
      field :latitude
      field :longitude
    end
  end
end
