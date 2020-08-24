class CreateItemComments < ActiveRecord::Migration[6.0]
  def change
    create_table :item_comments do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.text       :item_comment, null: false
      t.timestamps
    end
  end
end
