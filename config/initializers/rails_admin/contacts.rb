RailsAdmin.config do |config|
  config.model Contact do
    list do
      items_per_page 100
      sort_by :created_at

      field :name
      field :position
      field :email
    end

    edit do
      field :name
      field :position
      field :email
      field :phone
    end
  end
end

