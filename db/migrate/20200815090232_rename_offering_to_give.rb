class RenameOfferingToGive < ActiveRecord::Migration[6.0]
  def change
    rename_table :offerings, :gives
  end
end
