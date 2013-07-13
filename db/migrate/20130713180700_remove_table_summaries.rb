class RemoveTableSummaries < ActiveRecord::Migration
  def up
    drop_table :summaries
  end

  def down
    create_table :summaries do |t|
      t.string :title
      t.date   :happened_at
      t.string :document_url

      t.timestamps
    end
  end
end
