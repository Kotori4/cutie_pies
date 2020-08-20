class CreateCatPostComments < ActiveRecord::Migration[6.0]
  def change
    create_table :cat_post_comments do |t|
      t.references :user, foreign_key: true
      t.references :cat_post, foreign_key: true
      t.text       :cat_post_comment, null: false
      t.timestamps
    end
  end
end
