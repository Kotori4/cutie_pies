class CreateGoods < ActiveRecord::Migration[6.0]
  def change
    create_table :goods do |t|
      t.references :user, foreign_key: true 
      t.string :goods_title, null: false
      t.text :goods_text, null: false 
      t.timestamps
    end
  end
end
