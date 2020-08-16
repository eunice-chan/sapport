class RemoveNameIndex < ActiveRecord::Migration[6.0]
  def change
    remove_index :rooms, :name
  end
end
