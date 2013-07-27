RailsAdmin.config do |config|
  config.model Content do
    list do
      items_per_page 100
      sort_by :code

      field :code
      field :updated_at
    end

    edit do
      field :code
      field :content, :text do
        ckeditor true
      end
    end
  end
end
