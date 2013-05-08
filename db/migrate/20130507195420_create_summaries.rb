class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :title
      t.date :happened_at
      t.string :document_url

      t.timestamps
    end
  end
end
