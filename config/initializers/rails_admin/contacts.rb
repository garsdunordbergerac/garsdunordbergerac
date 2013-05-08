RailsAdmin.config do |config|
  config.model Contact do
    list do
      items_per_page 100
      sort_by :created_at

      field :name
      field :email
      field :position
    end

    edit do
      field :name
      field :email
      field :position
    end
  end
end

