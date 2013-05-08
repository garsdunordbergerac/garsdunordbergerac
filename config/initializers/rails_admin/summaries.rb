RailsAdmin.config do |config|
  config.model Summary do
    list do
      items_per_page 100
      sort_by :happened_at
      sort_reverse false

      field :title
      field :happened_at
    end

    edit do
      field :title
      field :happened_at
      field :document_url
    end
  end
end

