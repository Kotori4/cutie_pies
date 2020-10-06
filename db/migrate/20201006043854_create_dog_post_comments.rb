class CreateDogPostComments < ActiveRecord::Migration[6.0]
  def change
    create_table :dog_post_comments do |t|

      t.timestamps
    end
  end
end
