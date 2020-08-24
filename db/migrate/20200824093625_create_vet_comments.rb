class CreateVetComments < ActiveRecord::Migration[6.0]
  def change
    create_table :vet_comments do |t|
      t.references :user, foreign_key: true
      t.references :vet, foreign_key: true
      t.text       :vet_comment, null: false
      t.timestamps
    end
  end
end
