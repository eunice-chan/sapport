class AddColumnsToGive < ActiveRecord::Migration[6.0]
  def change
    add_column :gives, :title, :string, null: false, default: ""
    add_column :gives, :description, :text, null: false, default: ""
    add_column :gives, :cost, :integer, null: false, default: 0
  end
end
