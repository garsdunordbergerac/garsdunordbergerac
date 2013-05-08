class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :code
      t.text :content

      t.timestamps
    end

    add_index(:contents, :code, unique: true)
  end
end
