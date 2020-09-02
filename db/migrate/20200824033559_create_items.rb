class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true 
      t.string :item_title, null: false
      t.text :item_text, null: false 
      t.text :item_link
      t.timestamps
    end
  end
end
