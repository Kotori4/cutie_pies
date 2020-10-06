class CreateDogPostComments < ActiveRecord::Migration[6.0]
  def change
    create_table :dog_post_comments do |t|
      t.references :user, foreign_key: true
      t.references :dog_post, foreign_key: true
      t.text       :dog_post_comment, null: false
      t.timestamps
    end
  end
end
