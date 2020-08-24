class ChangeItemsToFoods < ActiveRecord::Migration[6.0]
  def change
    rename_table :items, :foods
  end
end
