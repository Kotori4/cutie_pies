class CreateCatPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :cat_posts do |t|
      t.references :user, foreign_key: true
      t.string     :post_title, null: false
      t.text       :post_text, null: false
      t.timestamps
    end
  end
end

