class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.string :code
      t.string :value

      t.timestamps
    end
  end
end
