class CreateHeadquarters < ActiveRecord::Migration
  def change
    create_table :headquarters do |t|
      t.string :title
      t.string :street
      t.string :postcode
      t.string :city
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
