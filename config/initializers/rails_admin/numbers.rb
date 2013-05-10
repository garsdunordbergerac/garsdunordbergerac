RailsAdmin.config do |config|
  config.model Number do
    list do
      items_per_page 100
      sort_by :code

      field :code
      field :value
    end

    edit do
      field :code
      field :value
    end
  end
end
