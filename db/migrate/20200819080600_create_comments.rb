class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :cat_post_id
      t.text    :cat_post_comment
      t.timestamps
    end
  end
end
