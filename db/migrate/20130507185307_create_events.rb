class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :begin_at
      t.date :end_at
      t.string :place
      t.text :description
      t.string :album_title

      t.timestamps
    end
  end
end
