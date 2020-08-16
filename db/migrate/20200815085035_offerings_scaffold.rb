class OfferingsScaffold < ActiveRecord::Migration[6.0]
  def change
    drop_table :offerings
    rename_table :tasks, :offerings
    add_reference :offerings, :user, null: false, foreign_key: true
  end
end
