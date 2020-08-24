class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.references :user, foreign_key: true 
      t.string :food_title, null: false
      t.text :food_text, null: false 
      t.timestamps
    end
  end
end

