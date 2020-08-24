class CreateVets < ActiveRecord::Migration[6.0]
  def change
    create_table :vets do |t|
      t.references :user, foreign_key: true 
      t.string :vet_title, null: false
      t.text :vet_text, null: false 
      t.timestamps
    end
  end
end
