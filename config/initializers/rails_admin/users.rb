RailsAdmin.config do |config|
  config.model User do
    list do
      items_per_page 100
      sort_by :id
      sort_reverse false

      field :email
      field :sign_in_count
      field :current_sign_in_at
    end
  end
end
