class CreateDogPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :dog_posts do |t|
      t.references :user, foreign_key: true
      t.string     :dog_post_title, null: false
      t.text       :dog_post_text, null: false
      t.timestamps
    end
  end
end
