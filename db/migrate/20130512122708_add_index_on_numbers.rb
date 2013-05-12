class AddIndexOnNumbers < ActiveRecord::Migration
  def up
    add_index :numbers, :code, unique: true
  end

  def down
    remove_index :numbers, :code
  end
end
